import 'package:flutter/material.dart';
import 'package:oruphones/src/presentation/home/widgets/widgets.dart';
import 'package:oruphones/src/presentation/search/search.dart';
import 'package:oruphones/src/presentation/widgets/widgets.dart';
import 'package:oruphones/src/ui/padding.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OruAppBar(
        onSearchBarTap: () => Navigator.push(
          context,
          SearchPage.route(),
        ),
      ),
      body: const CustomScrollView(
        slivers: [
          SliverPadding(
            padding: OruPadding.kDefault,
            sliver: SliverNearbyListingsHeader(),
          ),
          SliverPadding(
            padding: OruPadding.kDefault,
            sliver: SliverNearbyListings(),
          ),
          SliverPadding(
            padding: OruPadding.kDefault,
            sliver: SliverLoadMoreButton(),
          ),
        ],
      ),
    );
  }
}
