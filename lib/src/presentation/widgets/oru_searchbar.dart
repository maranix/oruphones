import 'package:flutter/material.dart';
import 'package:oruphones/src/ui/padding.dart';

class OruSearchBar extends StatefulWidget {
  const OruSearchBar({
    super.key,
    this.onTap,
    this.onChanged,
    this.onLeadingTap,
    this.shouldFocusSearch = false,
  });

  final VoidCallback? onTap;
  final VoidCallback? onLeadingTap;
  final bool shouldFocusSearch;
  final void Function(String? text)? onChanged;

  @override
  State<OruSearchBar> createState() => _OruSearchBarState();
}

class _OruSearchBarState extends State<OruSearchBar> {
  late final TextEditingController _controller;
  FocusNode? _focusNode;

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
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      leading: const Icon(Icons.search),
      trailing: [
        GestureDetector(
          onTap: () {
            if (widget.onLeadingTap != null) {
              _controller.clear();
              widget.onLeadingTap!();
            }
          },
          child: const Icon(Icons.cancel),
        )
      ],
      hintStyle: MaterialStatePropertyAll<TextStyle>(
          Theme.of(context).textTheme.bodyMedium!),
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
