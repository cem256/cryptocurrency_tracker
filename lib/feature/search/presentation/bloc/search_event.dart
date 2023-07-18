part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  /// Event to fetch the search results for the query.
  const factory SearchEvent.onQueryChanged({required String query}) = _QueryChanged;

  /// Event to clear the search field
  const factory SearchEvent.onSearchFieldCleared() = _SearchFieldCleared;
}
