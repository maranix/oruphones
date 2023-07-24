import 'package:flutter/material.dart';
import 'package:oruphones/data/repository/repository.dart';
import 'package:oruphones/src/app/app.dart';
import 'package:http/http.dart' as http;

import 'app_view.dart';

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
        child: const AppView(),
      ),
    );
  }
}
