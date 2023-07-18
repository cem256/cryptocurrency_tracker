import 'package:cryptocurrency_tracker/app/errors/failures/failure.dart';
import 'package:cryptocurrency_tracker/feature/favorites/domain/models/favorite_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class FavoritesRepository {
  Future<void> init();
  Either<Failure, List<FavoriteEntity>> getFavorites();
  Future<Either<Failure, List<FavoriteEntity>>> addOrRemoveItem(FavoriteEntity item);
}
