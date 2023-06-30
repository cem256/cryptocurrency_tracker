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
    return TextField(
      autofocus: true,
      controller: _searchController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search_outlined),
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear_outlined),
          onPressed: () {
            _searchController.clear();
            context.read<SearchBloc>().add(const SearchEvent.onSearchFieldCleared());
          },
        ),
        hintText: 'Search',
      ),
      onChanged: (query) => context.read<SearchBloc>().add(SearchEvent.onQueryChanged(query: query)),
    );
  }
}
