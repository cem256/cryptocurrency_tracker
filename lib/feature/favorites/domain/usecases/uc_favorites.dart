import 'package:cryptocurrency_tracker/core/models/failure/failure_model.dart';
import 'package:cryptocurrency_tracker/feature/favorites/domain/models/favorite_entity.dart';
import 'package:cryptocurrency_tracker/feature/favorites/domain/repositories/favorites_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class UCFavorites {
  UCFavorites({required FavoritesRepository repository}) : _repository = repository;

  final FavoritesRepository _repository;

  Future<void> init() async {
    return _repository.init();
  }

  Either<FailureModel, List<FavoriteEntity>> getFavorites() {
    return _repository.getFavorites();
  }

  Future<Either<FailureModel, List<FavoriteEntity>>> favoritesButtonClicked(FavoriteEntity item) async {
    return _repository.addOrRemoveItem(item);
  }
}
