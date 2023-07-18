import 'package:cryptocurrency_tracker/app/errors/failures/failure.dart';
import 'package:cryptocurrency_tracker/feature/favorites/data/datasources/local/favorites_local_data_source.dart';
import 'package:cryptocurrency_tracker/feature/favorites/data/models/favorite_model.dart';
import 'package:cryptocurrency_tracker/feature/favorites/domain/models/favorite_entity.dart';
import 'package:cryptocurrency_tracker/feature/favorites/domain/repositories/favorites_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FavoritesRepository)
final class FavoritesRepositoryImpl implements FavoritesRepository {
  FavoritesRepositoryImpl({required FavoritesLocalDataSource dataSource}) : _dataSource = dataSource;

  final FavoritesLocalDataSource _dataSource;

  @override
  // Initialize the data source
  Future<void> init() async {
    await _dataSource.init();
  }

  @override
  // Get all favorites from cache
  Either<Failure, List<FavoriteEntity>> getFavorites() {
    try {
      final favorites = _dataSource.getFavorites();

      return right(favorites.map((e) => e.toFavoriteEntity()).toList());
    } catch (e) {
      debugPrint('ERROR: Method getFavorites MESSAGE: $e');
      return left(const Failure.unknownFailure());
    }
  }

  @override
  // If item is already in favorites, remove it, otherwise add it
  Future<Either<Failure, List<FavoriteEntity>>> addOrRemoveItem(FavoriteEntity item) async {
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
      debugPrint('ERROR: Method addOrRemoveItem MESSAGE: $e');
      return left(const Failure.unknownFailure());
    }
  }
}
