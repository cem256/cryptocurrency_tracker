import 'package:cryptocurrency_tracker/core/models/failure/failure_model.dart';
import 'package:cryptocurrency_tracker/feature/favorites/domain/models/favorite_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class FavoritesRepository {
  Future<void> init();
  Either<FailureModel, List<FavoriteEntity>> getFavorites();
  Future<Either<FailureModel, List<FavoriteEntity>>> addOrRemoveItem(FavoriteEntity item);
}
