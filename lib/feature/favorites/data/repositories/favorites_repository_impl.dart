import 'dart:developer';

import 'package:crypto_app/core/models/failure/failure_model.dart';

import 'package:crypto_app/feature/favorites/data/datasources/local/favorites_local_data_source.dart';
import 'package:crypto_app/feature/favorites/data/models/favorite_model.dart';
import 'package:crypto_app/feature/favorites/domain/models/favorite_entity.dart';
import 'package:crypto_app/feature/favorites/domain/repositories/favorites_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FavoritesRepository)
class FavoritesRepositoryImpl implements FavoritesRepository {
  FavoritesRepositoryImpl({required FavoritesLocalDataSource dataSource}) : _dataSource = dataSource;

  final FavoritesLocalDataSource _dataSource;

  @override
  Future<void> init() async {
    await _dataSource.init();
  }

  @override
  Either<FailureModel, List<FavoriteEntity>> getFavorites() {
    try {
      final favorites = _dataSource.getFavorites();

      return right(favorites.map((e) => e.toFavoriteEntity()).toList());
    } catch (_) {
      return left(const FailureModel());
    }
  }

  @override
  Future<Either<FailureModel, List<FavoriteEntity>>> addOrRemoveItem(FavoriteEntity item) async {
    try {
      final favorites = _dataSource.getFavorites();
      final favorite = item.toFavoriteModel();

      if (favorites.contains(favorite)) {
        final index = favorites.indexOf(favorite);
        await _dataSource.removeFromFavorites(index);
      } else {
        await _dataSource.addToFavorites(favorite);
      }
      final newFavorites = _dataSource.getFavorites();
      return right(newFavorites.map((e) => e.toFavoriteEntity()).toList());
    } catch (e) {
      log('ERROR: FavoritesRepositoryImpl: $e');
      return left(const FailureModel());
    }
  }
}
