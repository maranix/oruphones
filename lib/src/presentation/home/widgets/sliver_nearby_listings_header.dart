import 'package:flutter/material.dart';
import 'package:oruphones/src/presentation/home/widgets/widgets.dart';
import 'package:oruphones/src/ui/colors.dart';

class SliverNearbyListingsHeader extends StatelessWidget {
  const SliverNearbyListingsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
              children: const [
                TextSpan(text: 'Best Deals Near You\t\t'),
                TextSpan(
                  text: 'India',
                  style: TextStyle(
                    color: OruColors.nearYou,
                    decoration: TextDecoration.underline,
                    decorationColor: OruColors.nearYou,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                'Filter',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const FiltersBottomModal(),
            ],
          ),
        ],
      ),
    );
  }
}
