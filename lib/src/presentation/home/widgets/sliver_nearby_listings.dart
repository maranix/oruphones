import 'package:cached_network_image/cached_network_image.dart';
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
            key: ValueKey(state.data.hashCode),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            delegate: SliverChildBuilderDelegate(
              childCount: state.data.listings.length,
              (context, index) => NearbyListingItem(
                key: ObjectKey(state.data.listings[index]),
                listing: state.data.listings[index],
              ),
            ),
          ),
        HomeLoadingMore() => SliverGrid(
            key: ValueKey(state.listingData.hashCode),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            delegate: SliverChildBuilderDelegate(
              childCount: state.listingData.listings.length,
              (context, index) => NearbyListingItem(
                key: ObjectKey(state.listingData.listings[index]),
                listing: state.listingData.listings[index],
              ),
            ),
          ),
        HomeLoading() || HomeInitial() => const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          ),
        _ => const SliverFillRemaining(
            child: Center(
              child: Text('Something went wrong'),
            ),
          ),
      },
    );
  }
}

class NearbyListingItem extends StatelessWidget {
  const NearbyListingItem({
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
                  child: CachedNetworkImage(
                    imageUrl: listing.defaultImage.fullImage,
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                    fit: BoxFit.contain,
                    memCacheHeight: 200,
                    memCacheWidth: 200,
                    maxHeightDiskCache: 200,
                    maxWidthDiskCache: 200,
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
                  listing.deviceCondition,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 10,
                      ),
                )
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
