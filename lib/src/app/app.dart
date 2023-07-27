import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oruphones/src/app/services/notifications_service.dart';
import 'package:oruphones/src/data/repository/repository.dart';
import 'package:oruphones/src/features/features.dart';
import 'package:oruphones/src/presentation/presentation.dart';
import 'package:oruphones/src/ui/theme.dart';

class AppEntry extends StatelessWidget {
  const AppEntry({
    super.key,
    required this.notificationService,
  });

  final NotificationsI notificationService;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => AssignmentRepository(
        client: http.Client(),
      ),
      child: BlocProvider(
        create: (_) => AppBloc(
          notificationService: notificationService,
        )..add(const AppFCMStarted()),
        child: const _AppView(),
      ),
    );
  }
}

class _AppView extends StatelessWidget {
  const _AppView();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: oruTheme,
      home: const HomePage(),
    );
  }
}
