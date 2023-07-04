import 'package:crypto_app/core/models/failure/failure_model.dart';
import 'package:crypto_app/feature/favorites/domain/models/favorite_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class FavoritesRepository {
  Future<void> init();
  Either<FailureModel, List<FavoriteEntity>> getFavorites();
  Future<Either<FailureModel, List<FavoriteEntity>>> addOrRemoveItem(FavoriteEntity item);
}
