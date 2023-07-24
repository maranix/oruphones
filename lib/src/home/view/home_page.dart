import 'package:flutter/material.dart';
import 'package:oruphones/data/repository/assignment/assignment.dart';
import 'package:oruphones/src/home/home.dart';

import 'home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = context.read<AssignmentRepository>();

    return BlocProvider(
      create: (_) => HomeBloc(repo:  repo)..add(const HomeListingsFetched()),
      child: const HomeView(),
    );
  }
}
