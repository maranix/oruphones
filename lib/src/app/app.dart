import 'package:flutter/material.dart';
import 'package:oruphones/src/data/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:oruphones/src/features/features.dart';
import 'package:oruphones/src/presentation/presentation.dart';

class AppEntry extends StatelessWidget {
  const AppEntry({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => AssignmentRepository(
        client: http.Client(),
      ),
      child: BlocProvider(
        create: (_) => AppBloc(),
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
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
