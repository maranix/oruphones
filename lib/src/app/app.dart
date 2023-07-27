import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oruphones/src/data/repository/repository.dart';
import 'package:oruphones/src/features/features.dart';
import 'package:oruphones/src/presentation/presentation.dart';
import 'package:oruphones/src/ui/colors.dart';

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
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: OruColors.primary,
          iconTheme: IconThemeData(color: OruColors.appBarIcon),
        ),
        cardTheme: const CardTheme(
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            elevation: 0,
            foregroundColor: Colors.grey,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  5,
                ),
              ),
              side: BorderSide(
                color: Colors.grey,
                width: 1.5,
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
