import 'package:flutter/material.dart';

class OruSearchBar extends StatelessWidget {
  const OruSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SearchBar(
      shape: MaterialStatePropertyAll<OutlinedBorder>(
        RoundedRectangleBorder(),
      ),
      shadowColor: MaterialStatePropertyAll<Color>(Colors.transparent),
    );
  }
}
