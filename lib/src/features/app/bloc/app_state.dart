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

// Define a subclass 'MessageReceived' of 'AppState'.
// This class represents the state when a message is received by the app.
final class MessageReceived extends AppState {
  // Constructor for the 'MessageReceived' class.
  const MessageReceived({
    required this.message,
  });

  // Field to store the received remote message.
  final RemoteMessage message;

  // Override the 'props' getter to ensure object equality comparison with the 'message' field.
  @override
  List<Object?> get props => [
        message,
      ];
}
