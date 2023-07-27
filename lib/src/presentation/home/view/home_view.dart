import 'package:flutter/material.dart';
import 'package:oruphones/src/presentation/home/widgets/widgets.dart';
import 'package:oruphones/src/presentation/widgets/widgets.dart';
import 'package:oruphones/src/ui/padding.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: OruAppBar(),
      body: CustomScrollView(
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
