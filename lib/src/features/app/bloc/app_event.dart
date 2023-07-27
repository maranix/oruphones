part of 'app_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

final class AppFCMStarted extends AppEvent {
  const AppFCMStarted();
}

final class AppMessageInbound extends AppEvent {
  const AppMessageInbound({
    required this.message,
  });

  final RemoteMessage message;

  @override
  List<Object?> get props => [message];
}
