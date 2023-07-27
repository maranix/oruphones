import 'package:flutter/material.dart';
import 'package:oruphones/src/ui/padding.dart';

class OruSearchBar extends StatefulWidget {
  const OruSearchBar({
    super.key,
    this.onTap,
    this.shouldFocusSearch = false,
  });

  final VoidCallback? onTap;
  final bool shouldFocusSearch;

  @override
  State<OruSearchBar> createState() => _OruSearchBarState();
}

class _OruSearchBarState extends State<OruSearchBar> {
  late final TextEditingController _controller;
  FocusNode? _focusNode;

  void _onChanged(String? text) {}

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();

    if (widget.shouldFocusSearch) {
      _focusNode = FocusNode();
      _focusNode?.requestFocus();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      focusNode: _focusNode,
      controller: _controller,
      onChanged: _onChanged,
      onTap: widget.onTap,
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
