import 'package:flutter/material.dart';
import 'package:oruphones/src/presentation/widgets/widgets.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: OruAppBar(
        shouldFocusSearchBar: true,
      ),
    );
  }
}
