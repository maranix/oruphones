part of 'app_bloc.dart';

// Define a sealed class 'AppEvent' that extends 'Equatable'.
// This class represents the events that can occur in the 'AppBloc'.
sealed class AppEvent extends Equatable {
  // Constructor for the 'AppEvent' class.
  const AppEvent();

  // Override the 'props' getter to ensure object equality comparison.
  @override
  List<Object?> get props => [];
}

// Define a subclass 'AppFCMStarted' of 'AppEvent'.
// This class represents the event when the FCM (Firebase Cloud Messaging) service is started.
final class AppFCMStarted extends AppEvent {
  // Constructor for the 'AppFCMStarted' class.
  const AppFCMStarted();
}

// Define a subclass 'AppMessageInbound' of 'AppEvent'.
// This class represents the event when an inbound message is received by the app.
final class AppMessageInbound extends AppEvent {
  // Constructor for the 'AppMessageInbound' class.
  const AppMessageInbound({
    required this.message,
    required this.isForegroundMessage,
  });

  // Field to store the incoming remote message.
  final RemoteMessage message;

  // Field to indicate whether this is a Foreground or Background message.
  final bool isForegroundMessage;

  // Override the 'props' getter to ensure object equality comparison with the 'message' field.
  @override
  List<Object?> get props => [message, isForegroundMessage];
}

// Define a subclass 'AppHandleRemoteMessage' of 'AppEvent'.
// This class represents the event when a remote message is handled by the app.
final class AppHandleRemoteMessage extends AppEvent {
  // Constructor for the 'AppHandleRemoteMessage' class.
  const AppHandleRemoteMessage({
    required this.payload,
  });

  // Field to store the payload of the remote message.
  final Map<String, dynamic> payload;

  // Override the 'props' getter to ensure object equality comparison with the 'payload' field.
  @override
  List<Object?> get props => [payload];
}
