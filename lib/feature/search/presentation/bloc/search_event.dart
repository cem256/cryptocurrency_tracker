part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.onQueryChanged({required String query}) = _QueryChanged;
  const factory SearchEvent.onSearchFieldCleared() = _SearchFieldCleared;
}
