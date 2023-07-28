import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Define an interface class 'NotificationsI' that declares the contract for notifications.
// Any class implementing this interface should provide an 'init' method that returns a Future<void>.
interface class NotificationsI {
  /// Initialize the notification service.
  ///
  /// This method should be implemented by classes that provide notifications functionality.
  /// It should handle the necessary setup and permissions required for notifications.
  ///
  /// Throws:
  ///   UnimplementedError: When the method is not yet implemented in the derived class.
  Future<void> init({
    Function(NotificationResponse)? onDidReceiveNotification,
  }) {
    throw UnimplementedError('init() method is not yet implemented');
  }

  /// Get the FCM token for the device.
  ///
  /// Returns:
  ///   A Future<String?> representing the FCM token for the device.
  Future<String?> getToken() {
    throw UnimplementedError('getToken() method is not yet implemented');
  }

  /// Show a notification using the provided RemoteNotification.
  ///
  /// Parameters:
  ///   notification: The RemoteNotification to display in the notification.
  ///   payload: An optional payload data to associate with the notification.
  void showNotification(
    RemoteNotification notification, {
    String? payload,
  }) {
    throw UnimplementedError(
        'showNotification() method is not yet implemented');
  }
}

// Define a class 'FirebaseNotificationsService' that implements the 'NotificationsI' interface.
// This class provides notifications functionality using Firebase Cloud Messaging (FCM).
class FirebaseNotificationsService implements NotificationsI {
  const FirebaseNotificationsService({
    required FirebaseMessaging messagingService,
    required FlutterLocalNotificationsPlugin localNotificationsPlugin,
  })  : _messaging = messagingService,
        _localNotificationsPlugin = localNotificationsPlugin;

  // Firebase Cloud Messaging instance used for handling notifications.
  final FirebaseMessaging _messaging;

  // Local Notifications Plugin used for Foreground notifications.
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin;

  /// Android specific Notification Details
  ///
  /// Configuration for mentioning broadcast channel to use for notifications
  static const _androidNotificationDetails = AndroidNotificationDetails(
    'high_importance_channel',
    'High Importance Notifications',
    channelDescription: 'This channel is used for important notifications.',
    importance: Importance.max,
  );

  /// iOS specific Notification Details
  static const _iosNotificationDetails = DarwinNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

  /// FlutterLocalNotifications Android Initialization Settings
  static const _androidInitializationSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  /// FlutterLocalNotifications IOS Initialization Settings
  static const _iosInitializationSettings = DarwinInitializationSettings();

  static const _initializationSettings = InitializationSettings(
    android: _androidInitializationSettings,
    iOS: _iosInitializationSettings,
  );

  @override
  Future<void> init({
    Function(NotificationResponse)? onDidReceiveNotification,
  }) async {
    // Request permissions required for displaying notifications.
    // This method is called during the initialization of the notification service.
    if (Platform.isAndroid) {
      await _localNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.requestPermission();

      await _localNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(
            const AndroidNotificationChannel(
              'high_importance_channel',
              'High Importance Notifications',
              description: 'This channel is used for important notifications.',
              importance: Importance.max,
            ),
          );
    } else {
      await _localNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            sound: true,
            alert: true,
            badge: true,
            critical: true,
          );
    }

    // Initialize the flutter_local_notifications plugin with configurations
    await _localNotificationsPlugin.initialize(
      _initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotification,
    );
  }

  @override
  void showNotification(
    RemoteNotification notification, {
    String? payload,
  }) {
    _localNotificationsPlugin.show(
      0,
      notification.title ?? '',
      notification.body ?? '',
      const NotificationDetails(
        android: _androidNotificationDetails,
        iOS: _iosNotificationDetails,
      ),
      payload: payload,
    );
  }

  @override
  Future<String?> getToken() => _messaging.getToken();
}
