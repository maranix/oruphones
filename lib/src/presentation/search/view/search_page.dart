import 'package:flutter/material.dart';
import 'package:oruphones/src/data/repository/repository.dart';
import 'package:oruphones/src/features/search/search.dart';
import 'package:oruphones/src/presentation/search/search.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const SearchPage(),
      );

  @override
  Widget build(BuildContext context) {
    final repo = context.read<AssignmentRepository>();

    return BlocProvider(
      create: (_) => SearchBloc(repo: repo),
      child: const SearchView(),
    );
  }
}
