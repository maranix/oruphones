part of 'app_bloc.dart';

// Define a sealed class 'AppState' that extends 'Equatable'.
// This class represents the states of the 'AppBloc'.
sealed class AppState extends Equatable {
  // Constructor for the 'AppState' class.
  const AppState();

  // Override the 'props' getter to ensure object equality comparison.
  @override
  List<Object?> get props => [];
}

// Define a subclass 'AppInitial' of 'AppState'.
// This class represents the initial state of the 'AppBloc'.
final class AppInitial extends AppState {
  // Constructor for the 'AppInitial' class.
  const AppInitial();
}

// Define a subclass 'AppNotificationsListening' of 'AppState'.
// This class represents the state when the app is listening for notifications.
final class AppNotificationsListening extends AppState {
  // Constructor for the 'AppNotificationsListening' class.
  const AppNotificationsListening();
}

// Define a subclass 'MessageReceived' of 'AppState'.
// This class represents the state when a message is received by the app.
final class MessageReceived extends AppState {
  // Constructor for the 'MessageReceived' class.
  const MessageReceived({
    required this.payload,
  });

  // Field to store the received remote message.
  final Map<String, dynamic> payload;

  // Override the 'props' getter to ensure object equality comparison with the 'payload' field.
  @override
  List<Object?> get props => [
        payload,
      ];
}
