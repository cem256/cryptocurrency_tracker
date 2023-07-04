import 'package:cryptocurrency_tracker/app/constants/cache_constants.dart';
import 'package:cryptocurrency_tracker/core/clients/cache/cache_client_interface.dart';
import 'package:cryptocurrency_tracker/feature/favorites/data/models/favorite_model.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class FavoritesCacheClient extends CacheClientInterface<FavoriteModel, FavoriteModelAdapter> {
  @override
  String get boxName => CacheConstants.favoritesBox;

  @override
  int get typeId => CacheConstants.favoritesTypeID;

  @override
  FavoriteModelAdapter get adapter => FavoriteModelAdapter();
}
