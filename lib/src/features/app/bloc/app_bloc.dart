import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
    // Subscribe to the 'onMessage' Stream to handle incoming messages when the app is in the foreground.
    _messageStream = FirebaseMessaging.onMessage.listen(
      _handleRemoteMessages,
    );
    // Subscribe to the 'onMessageOpenedApp' Stream to handle interactions when the app is in the background.
    _messageOpenedAppStream =
        FirebaseMessaging.onMessageOpenedApp.listen(_handleRemoteMessages);

    // Register event handlers using the 'on' method.
    on<AppFCMStarted>(_onFCMStarted);
    on<AppMessageInbound>(_onMessageReceived);
  }

  // Method to handle the 'AppFCMStarted' event.
  // This method is called when the 'AppFCMStarted' event is triggered.
  Future<void> _onFCMStarted(
    AppFCMStarted event,
    Emitter<AppState> emit,
  ) async {
    // Initialize the notification service.
    await _notificationService.init();

    // Get the initial message if the app was opened from a notification.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the initial message is not null, handle it.
    if (initialMessage != null) {
      _handleRemoteMessages(initialMessage);
    }
  }

  // Method to handle the 'AppMessageInbound' event.
  // This method is called when the 'AppMessageInbound' event is triggered.
  Future<void> _onMessageReceived(
    AppMessageInbound event,
    Emitter<AppState> emit,
  ) async {
    // Check if the incoming message has a notification and a specific 'screen' data field.
    // If so, emit a 'MessageReceived' state.
    if (event.message.notification != null &&
        event.message.data['screen'] == 'notifications') {
      emit(MessageReceived(message: event.message));
    }
  }

  // Method to handle incoming remote messages.
  // This method adds an 'AppMessageInbound' event to the bloc when a remote message is received.
  void _handleRemoteMessages(RemoteMessage message) {
    add(AppMessageInbound(message: message));
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
