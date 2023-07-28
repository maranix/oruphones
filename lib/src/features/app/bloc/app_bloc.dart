import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:oruphones/src/app/services/notifications_service.dart';
import 'package:oruphones/src/features/app/app.dart';

part 'app_event.dart';
part 'app_state.dart';

// Define a class 'AppBloc' that extends 'Bloc' with 'AppEvent' and 'AppState'.
// This class manages the state and business logic of the 'App' feature in the application.
class AppBloc extends Bloc<AppEvent, AppState> {
  // Constructor for the 'AppBloc' class.
  // This constructor creates a new instance of 'AppBloc' with the provided notification service.
  //
  // Parameters:
  //   notificationService: An instance of 'NotificationsI' for handling notifications.
  AppBloc({
    required NotificationsI notificationService,
  })  : _notificationService = notificationService,
        super(const AppInitial()) {
    // Register event handlers using the 'on' method.
    on<AppFCMStarted>(_onFCMStarted);
    on<AppMessageInbound>(_onMessageInbound);
    on<AppHandleRemoteMessage>(_handleRemoteMessages);
  }

  // Method to handle the 'AppFCMStarted' event.
  // This method is called when the 'AppFCMStarted' event is triggered.
  Future<void> _onFCMStarted(
    AppFCMStarted event,
    Emitter<AppState> emit,
  ) async {
    // Initialize the notification service.
    await _notificationService.init(
      onDidReceiveNotification: _onDidReceiveNotification,
    );

    // Get the initial message if the app was opened from a notification.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the initial message is not null, handle it.
    if (initialMessage != null) {
      add(
        AppMessageInbound(
          message: initialMessage,
          isForegroundMessage: true,
        ),
      );
    }

    // Subscribe to the 'onMessage' Stream to handle incoming messages when the app is in the foreground.
    _messageStream = FirebaseMessaging.onMessage.listen(
      (message) {
        add(
          AppMessageInbound(
            message: message,
            isForegroundMessage: true,
          ),
        );
      },
    );

    // Subscribe to the 'onMessageOpenedApp' Stream to handle interactions when the app is in the background.
    _messageOpenedAppStream = FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        add(
          AppMessageInbound(
            message: message,
            isForegroundMessage: false,
          ),
        );
      },
    );

    emit(const AppNotificationsListening());
  }

  // Method to handle the 'AppMessageInbound' event.
  // This method is called when the 'AppMessageInbound' event is triggered.
  Future<void> _onMessageInbound(
    AppMessageInbound event,
    Emitter<AppState> emit,
  ) async {
    // Check if the message is from a foreground notification.
    if (event.isForegroundMessage) {
      if (event.message.notification != null) {
        // Show the notification using the notification service.
        _notificationService.showNotification(
          event.message.notification!,
          payload: jsonEncode(event.message.data),
        );
      }
    } else {
      // Add the 'AppHandleRemoteMessage' event to process the payload data.
      add(AppHandleRemoteMessage(payload: event.message.data));
    }
  }

  // Method to handle the 'AppHandleRemoteMessage' event.
  // This method is called when the 'AppHandleRemoteMessage' event is triggered.
  void _handleRemoteMessages(
    AppHandleRemoteMessage event,
    Emitter<AppState> emit,
  ) {
    // Emit the 'MessageReceived' state and update the 'AppNotificationsListening' state.
    emit(MessageReceived(payload: event.payload));
    emit(const AppNotificationsListening());
  }

  // Method to handle the notification response when a notification is received.
  void _onDidReceiveNotification(NotificationResponse notificationResponse) {
    if (notificationResponse.payload != null) {
      final Map<String, dynamic> payload =
          jsonDecode(notificationResponse.payload!);

      // Add the 'AppHandleRemoteMessage' event to process the payload data.
      add(AppHandleRemoteMessage(payload: payload));
    }
  }

  // Private field to store the notification service instance.
  final NotificationsI _notificationService;

  // Stream subscriptions for handling incoming messages.
  StreamSubscription<RemoteMessage>? _messageStream;
  StreamSubscription<RemoteMessage>? _messageOpenedAppStream;

  // Override the 'close' method to dispose of the stream subscriptions when the bloc is closed.
  @override
  Future<void> close() {
    _messageStream?.cancel();
    _messageOpenedAppStream?.cancel();

    return super.close();
  }
}
