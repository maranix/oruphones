import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:oruphones/firebase_options.dart';
import 'package:oruphones/src/app/app.dart';
import 'package:oruphones/src/app/services/notifications_service.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  final notificationService = FirebaseNotificationsService(
    messagingService: FirebaseMessaging.instance,
    localNotificationsPlugin: FlutterLocalNotificationsPlugin(),
  );

  runApp(
    AppEntry(
      notificationService: notificationService,
    ),
  );
}
