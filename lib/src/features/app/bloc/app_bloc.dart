import 'package:equatable/equatable.dart';
import 'package:oruphones/src/app/services/notifications_service.dart';
import 'package:oruphones/src/features/app/app.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required NotificationsI notificationService,
  })  : _notificationService = notificationService,
        super(const AppInitial()) {
    on<AppFCMStarted>(_onFCMStarted);
  }

  Future<void> _onFCMStarted(
    AppFCMStarted event,
    Emitter<AppState> emit,
  ) async {
    await _notificationService.init();
  }

  final NotificationsI _notificationService;
}
