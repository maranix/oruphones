import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:oruphones/src/features/home/home.dart';
import 'package:oruphones/src/ui/colors.dart';

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
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Filters',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const Spacer(),
                          const Text(
                            'Clear Filter',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              decoration: TextDecoration.underline,
                              decorationThickness: 2,
                            ),
                          )
                        ],
                      ),
                      FilterCategory(
                        title: 'Brand',
                        data: state.filters.make,
                      ),
                      FilterCategory(
                        title: 'Ram',
                        data: state.filters.ram,
                      ),
                      FilterCategory(
                        title: 'Storage',
                        data: state.filters.storage,
                      ),
                      FilterCategory(
                        title: 'Condition',
                        data: state.filters.condition,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: OruColors.primary,
                        ),
                        onPressed: () {},
                        child: Text(
                          'Apply',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ),
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
                  Icons.cancel_outlined,
                  color: Colors.white,
                  size: 36,
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

class FilterCategory extends StatelessWidget {
  const FilterCategory({
    super.key,
    required this.title,
    required this.data,
  });

  final String title;
  final List<String> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        SizedBox(
          height: 60,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) => FilterChip(
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    12,
                  ),
                ),
              ),
              key: ValueKey(data[index]),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              label: Text(data[index]),
              onSelected: (bool value) {},
            ),
            separatorBuilder: (context, index) => const SizedBox(
              width: 12,
            ),
          ),
        )
      ],
    );
  }
}
