import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oruphones/src/features/home/home.dart';
import 'package:oruphones/src/data/model/model.dart';
import 'package:oruphones/src/presentation/widgets/widgets.dart';
import 'package:oruphones/src/ui/colors.dart';
import 'package:oruphones/src/ui/padding.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: OruAppBar(),
      body: Padding(
        padding: OruPadding.kDefault,
        child: NearbyListings(),
      ),
    );
  }
}

class NearbyListings extends StatelessWidget {
  const NearbyListings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.titleMedium,
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
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.sort),
                ),
              ],
            ),
          ],
        ),
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) => switch (state) {
            HomeLoaded() => Expanded(
                child: GridView.builder(
                  itemCount: state.data.listings.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.55,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) => ListingItem(
                    key: ObjectKey(state.data.listings[index]),
                    listing: state.data.listings[index],
                  ),
                ),
              ),
            HomeLoading() => const CircularProgressIndicator.adaptive(),
            _ => const Text('Something went wrong')
          },
        )
      ],
    );
  }
}

class ListingItem extends StatelessWidget {
  const ListingItem({
    super.key,
    required this.listing,
  });

  final Listing listing;

  @override
  Widget build(BuildContext context) {
    String formatDate(String dateString) {
      final inputFormat = DateFormat('MM/dd/yyyy');
      final inputDate = inputFormat.parse(dateString);

      final outputFormat = DateFormat('MMM dd');
      final outputDate = outputFormat.format(inputDate);

      return outputDate;
    }

    return Card(
      child: Padding(
        padding: OruPadding.kDefault,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 0.7,
                  child: Image.network(
                    listing.defaultImage.fullImage,
                    fit: BoxFit.fill,
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
              '${listing.listingNumPrice}',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              listing.marketingName,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  listing.deviceStorage,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  listing.deviceCondition,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  listing.listingLocation,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  formatDate(listing.listingDate),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
