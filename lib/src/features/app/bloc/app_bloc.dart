import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:oruphones/src/app/services/notifications_service.dart';
import 'package:oruphones/src/features/app/app.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required NotificationsI notificationService,
  })  : _notificationService = notificationService,
        super(const AppInitial()) {
    // handle any messages when the app is in the foreground via a
    // Stream listener
    _messageStream = FirebaseMessaging.onMessage.listen(
      _handleRemoteMessages,
    );
    // handle any interaction when the app is in the background via a
    // Stream listener
    _messageOpenedAppStream =
        FirebaseMessaging.onMessageOpenedApp.listen(_handleRemoteMessages);
    on<AppFCMStarted>(_onFCMStarted);
    on<AppMessageInbound>(_onMessageReceived);
  }

  Future<void> _onFCMStarted(
    AppFCMStarted event,
    Emitter<AppState> emit,
  ) async {
    await _notificationService.init();

    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If initial message is not null then handle it
    if (initialMessage != null) {
      _handleRemoteMessages(initialMessage);
    }
  }

  Future<void> _onMessageReceived(
    AppMessageInbound event,
    Emitter<AppState> emit,
  ) async {
    if (event.message.notification != null &&
        event.message.data['screen'] == 'notifications') {
      emit(MessageReceived(message: event.message));
    }
  }

  void _handleRemoteMessages(RemoteMessage message) {
    add(AppMessageInbound(message: message));
  }

  final NotificationsI _notificationService;

  StreamSubscription<RemoteMessage>? _messageStream;
  StreamSubscription<RemoteMessage>? _messageOpenedAppStream;

  @override
  Future<void> close() {
    _messageStream?.cancel();
    _messageOpenedAppStream?.cancel();

    return super.close();
  }
}
