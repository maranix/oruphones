import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oruphones/src/data/model/model.dart';
import 'package:oruphones/src/features/home/home.dart';
import 'package:oruphones/src/ui/padding.dart';

class SliverNearbyListings extends StatelessWidget {
  const SliverNearbyListings({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) => switch (state) {
        HomeLoaded() => SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            delegate: SliverChildBuilderDelegate(
              childCount: state.data.listings.length,
              (context, index) => SliverNearbyListingItem(
                key: ObjectKey(state.data.listings[index]),
                listing: state.data.listings[index],
              ),
            ),
          ),
        HomeLoading() => const SliverToBoxAdapter(
            child: CircularProgressIndicator.adaptive(),
          ),
        _ => const Text('Something went wrong'),
      },
    );
  }
}

class SliverNearbyListingItem extends StatelessWidget {
  const SliverNearbyListingItem({
    super.key,
    required this.listing,
  });

  final Listing listing;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: OruPadding.kNarrow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 0.9,
                  child: Image.network(
                    listing.defaultImage.fullImage,
                    fit: BoxFit.contain,
                  ),
                ),
                const Positioned(
                  right: 0,
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                  ),
                )
              ],
            ),
            const Spacer(),
            Text(
              NumberFormat.currency(
                locale: 'en_IN',
                symbol: '₹ ',
                decimalDigits: 0,
              ).format(
                listing.listingNumPrice,
              ),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Spacer(),
            Text(
              listing.marketingName,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).iconTheme.color,
                  ),
            ),
            const Spacer(flex: 2),
            Row(
              children: [
                Text(
                  listing.deviceStorage,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 10,
                      ),
                ),
                const Spacer(),
                Text(
                  'Condition: ${listing.deviceCondition}',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 10,
                      ),
                ),
              ],
            ),
            const Spacer(flex: 2),
            Row(
              children: [
                Text(
                  listing.listingLocation,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 10,
                      ),
                ),
                const Spacer(),
                Text(
                  DateFormat('MMM dd').format(listing.listingDate),
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 10,
                      ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
