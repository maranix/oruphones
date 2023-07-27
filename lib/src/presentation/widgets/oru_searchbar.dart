import 'package:flutter/material.dart';
import 'package:oruphones/src/ui/padding.dart';

class OruSearchBar extends StatefulWidget {
  const OruSearchBar({
    super.key,
  });

  @override
  State<OruSearchBar> createState() => _OruSearchBarState();
}

class _OruSearchBarState extends State<OruSearchBar> {
  late final TextEditingController _controller;

  void _onChanged(String? text) {}

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: _controller,
      onChanged: _onChanged,
      leading: const Icon(Icons.search),
      hintStyle: MaterialStatePropertyAll<TextStyle>(Theme.of(context).textTheme.bodyMedium!),
      padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
        OruPadding.searchBarInner,
      ),
      constraints: const BoxConstraints(maxHeight: 45),
      hintText: 'Search with make and model..',
      shape: MaterialStatePropertyAll<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      shadowColor: const MaterialStatePropertyAll<Color>(
        Colors.transparent,
      ),
    );
  }
}
