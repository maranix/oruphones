import 'package:flutter/material.dart';
import 'package:oruphones/src/features/features.dart';

class SliverLoadMoreButton extends StatelessWidget {
  const SliverLoadMoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => switch (state) {
          HomeLoadingMore() => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          _ => Column(
              children: [
                const SizedBox.square(
                  dimension: 10,
                ),
                FractionallySizedBox(
                  widthFactor: 0.6,
                  child: ElevatedButton(
                    onPressed: () => context.read<HomeBloc>().add(
                          const HomeMoreListingsFetched(),
                        ),
                    child: const Text('Load More'),
                  ),
                ),
                const SizedBox.square(
                  dimension: 50,
                ),
              ],
            ),
        },
      ),
    );
  }
}
