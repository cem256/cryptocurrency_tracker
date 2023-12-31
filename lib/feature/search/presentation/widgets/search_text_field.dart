part of '../view/search_view.dart';

class _SearchTextField extends StatefulWidget {
  const _SearchTextField();

  @override
  State<_SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<_SearchTextField> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      autofocus: true,
      controller: _searchController,
      prefixIcon: const Icon(Icons.search),
      suffixIcon: const Icon(Icons.clear),
      onSuffixTap: () {
        _searchController.clear();
        context.read<SearchBloc>().add(const SearchEvent.onSearchFieldCleared());
      },
      style: TextStyle(color: context.textTheme.bodyLarge?.color),
      borderRadius: BorderRadius.all(ThemeConstants.radiusCircular),
      placeholder: LocaleKeys.search_view_search_bar_hint.tr(),
      onChanged: (query) => context.read<SearchBloc>().add(SearchEvent.onQueryChanged(query: query)),
    );
  }
}
