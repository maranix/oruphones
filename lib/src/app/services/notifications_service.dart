import 'package:firebase_messaging/firebase_messaging.dart';

interface class NotificationsI {
  Future<void> init() {
    throw UnimplementedError('init() method is not yet implemented');
  }
}

final class FirebaseNotificationsService implements NotificationsI {
  const FirebaseNotificationsService({
    required FirebaseMessaging messagingService,
  }) : _messaging = messagingService;

  final FirebaseMessaging _messaging;

  Future<String?> get token => _messaging.getToken();

  @override
  Future<void> init() async {
    await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }
}
