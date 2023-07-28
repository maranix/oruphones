import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class FiltersBottomModal extends StatelessWidget {
  const FiltersBottomModal({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showCustomModalBottomSheet(
        context: context,
        builder: (context) => Container(
          height: MediaQuery.sizeOf(context).height * 0.7,
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const Text('Ram'),
                    Flexible(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) => FilterChip(
                          label: Text('$index'),
                          onSelected: (_) {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Text('Ram'),
                    Flexible(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) => FilterChip(
                          label: Text('$index'),
                          onSelected: (_) {},
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        containerWidget: (context, animation, child) => Material(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                ),
              ),
              child,
            ],
          ),
        ),
      ),
      icon: const Icon(Icons.sort),
    );
  }
}
