import 'package:flutter/material.dart';

class SliverLoadMoreButton extends StatelessWidget {
  const SliverLoadMoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const SizedBox.square(
            dimension: 10,
          ),
          FractionallySizedBox(
            widthFactor: 0.6,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Load More'),
            ),
          ),
          const SizedBox.square(
            dimension: 50,
          ),
        ],
      ),
    );
  }
}
