part of 'app_bloc.dart';

sealed class AppState extends Equatable {
  const AppState();

  @override
  List<Object?> get props => [];
}

final class AppInitial extends AppState {
  const AppInitial();
}

final class MessageReceived extends AppState {
  const MessageReceived({
    required this.message,
  });

  final RemoteMessage message;

  @override
  List<Object?> get props => [
        message,
      ];
}
