part of 'favorites_cubit.dart';

enum FavoritesStatus { loading, success, failure, empty }

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState({
    required FavoritesStatus status,
    required List<FavoriteEntity> favorites,
  }) = _FavoritesState;

  factory FavoritesState.initial() => const FavoritesState(
        status: FavoritesStatus.loading,
        favorites: <FavoriteEntity>[],
      );
}
