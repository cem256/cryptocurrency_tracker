part of 'search_bloc.dart';

enum SearchStatus { initial, loading, success, failure, noResult }

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required SearchStatus status,
    required String query,
    required List<SearchEntity> cryptocurrencies,
  }) = _SearchState;

  factory SearchState.initial() => const SearchState(
        status: SearchStatus.initial,
        query: '',
        cryptocurrencies: <SearchEntity>[],
      );
}
