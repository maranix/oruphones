import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:oruphones/src/features/home/home.dart';

class FiltersBottomModal extends StatelessWidget {
  const FiltersBottomModal({
    super.key,
    required this.bloc,
  });

  final HomeBloc bloc;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showCustomModalBottomSheet(
        context: context,
        builder: (context) => BlocProvider<HomeBloc>.value(
          value: bloc,
          child: Container(
            height: MediaQuery.sizeOf(context).height * 0.7,
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) => switch (state) {
                HomeLoaded() => Column(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const Text('Ram'),
                            Flexible(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.filters.make.length,
                                itemBuilder: (context, index) => FilterChip(
                                  label: Text(state.filters.make[index]),
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
                                itemCount: state.filters.ram.length,
                                itemBuilder: (context, index) => FilterChip(
                                  label: Text(state.filters.ram[index]),
                                  onSelected: (_) {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                HomeLoading() => const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                _ => const Center(
                    child: Text(
                      'Failed to load filters, Please check you internet connection',
                    ),
                  ),
              },
            ),
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
