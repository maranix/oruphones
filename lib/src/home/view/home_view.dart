import 'package:flutter/material.dart';
import 'package:oruphones/src/home/home.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return switch (state) {
              HomeLoading() => const CircularProgressIndicator.adaptive(),
              HomeLoaded() => Text("${state.data}"),
              HomeFailed() => const Text("Failed to load"),
              _ => const Text("HomePage"),
            };
          },
        ),
      ),
    );
  }
}
