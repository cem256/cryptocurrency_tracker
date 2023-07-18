// ignore_for_file: cascade_invocations

import 'package:cryptocurrency_tracker/app/errors/failures/failure.dart';
import 'package:cryptocurrency_tracker/feature/favorites/domain/models/favorite_entity.dart';
import 'package:cryptocurrency_tracker/feature/favorites/domain/usecases/uc_favorites.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'favorites_cubit.freezed.dart';
part 'favorites_state.dart';

@Injectable()
class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit({required UCFavorites uc})
      : _uc = uc,
        super(FavoritesState.initial());

  final UCFavorites _uc;

  Future<void> init() async {
    await _uc.init();
  }

  Future<void> getFavorites() async {
    emit(state.copyWith(status: FavoritesStatus.loading));
    final response = _uc.getFavorites();

    response.fold((failure) => emit(state.copyWith(status: FavoritesStatus.failure, failure: failure)), (success) {
      success.isEmpty
          ? emit(state.copyWith(favorites: success, status: FavoritesStatus.empty))
          : emit(state.copyWith(status: FavoritesStatus.success, favorites: success));
    });
  }

  Future<void> favoritesButtonClicked(FavoriteEntity item) async {
    final response = await _uc.favoritesButtonClicked(item);

    response.fold((failure) => emit(state.copyWith(status: FavoritesStatus.failure, failure: failure)), (success) {
      success.isEmpty
          ? emit(state.copyWith(favorites: success, status: FavoritesStatus.empty))
          : emit(state.copyWith(favorites: success, status: FavoritesStatus.success));
    });
  }
}
