import 'package:firebase_messaging/firebase_messaging.dart';

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
  Future<void> init() {
    throw UnimplementedError('init() method is not yet implemented');
  }
}

// Define a class 'FirebaseNotificationsService' that implements the 'NotificationsI' interface.
// This class provides notifications functionality using Firebase Cloud Messaging (FCM).
final class FirebaseNotificationsService implements NotificationsI {
  const FirebaseNotificationsService({
    required FirebaseMessaging messagingService,
  }) : _messaging = messagingService;

  // Firebase Cloud Messaging instance used for handling notifications.
  final FirebaseMessaging _messaging;

  /// Get the FCM token for the device.
  ///
  /// Returns:
  ///   A Future<String?> representing the FCM token for the device.
  Future<String?> get token => _messaging.getToken();

  @override
  Future<void> init() async {
    // Request permissions required for displaying notifications.
    // This method is called during the initialization of the notification service.
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
