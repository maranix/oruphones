import 'package:flutter/material.dart';
import 'package:oruphones/src/data/model/model.dart';
import 'package:oruphones/src/features/search/search.dart';
import 'package:oruphones/src/presentation/widgets/widgets.dart';
import 'package:oruphones/src/ui/padding.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OruAppBar(
        shouldFocusSearchBar: true,
        onSearchFieldLeadingPressed: () => context.read<SearchBloc>().add(
              const SearchReset(),
            ),
        onSearchFieldChanged: (query) => context.read<SearchBloc>().add(
              SearchAutoComplete(query),
            ),
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          return switch (state) {
            SearchInitial() => const SizedBox.shrink(),
            SearchLoading() => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            SearchLoaded() => SingleChildScrollView(
                child: Padding(
                  padding: OruPadding.kDefault.copyWith(top: 8, bottom: 8),
                  child: _SearchResults(
                    search: state.data,
                  ),
                ),
              ),
            SearchFailed() => Center(
                child: Text(
                  'Failed to load any search results, Please check you internet connect.',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
          };
        },
      ),
    );
  }
}

class _SearchResults extends StatelessWidget {
  const _SearchResults({required this.search});

  final Search search;

  @override
  Widget build(BuildContext context) {
    if (search.makes.isNotEmpty && search.models.isNotEmpty) {
      return _buildResults(context, search);
    } else if (search.makes.isNotEmpty && search.models.isEmpty) {
      return _buildMakesResult(context, search.makes);
    } else if (search.makes.isEmpty && search.models.isNotEmpty) {
      return _buildModelsResult(context, search.models);
    } else {
      return const Center(
        child: Text('No results found'),
      );
    }
  }

  Widget _buildResults(BuildContext context, Search search) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildMakesResult(context, search.makes),
        const SizedBox(
          height: 16,
        ),
        _buildModelsResult(context, search.models),
      ],
    );
  }

  Widget _buildMakesResult(BuildContext context, List<String> makes) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Makes',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        ...List.generate(
          makes.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              key: ObjectKey(makes[index]),
              makes[index],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildModelsResult(BuildContext context, List<String> models) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Models',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        ...List.generate(
          models.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              key: ObjectKey(models[index]),
              models[index],
            ),
          ),
        ),
      ],
    );
  }
}
