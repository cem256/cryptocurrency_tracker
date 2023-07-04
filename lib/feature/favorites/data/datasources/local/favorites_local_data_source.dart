import 'package:crypto_app/feature/favorites/data/datasources/local/favorites_cache_client.dart';
import 'package:crypto_app/feature/favorites/data/models/favorite_model.dart';
import 'package:injectable/injectable.dart';

abstract interface class FavoritesLocalDataSource {
  Future<void> init();
  List<FavoriteModel> getFavorites();
  Future<void> addToFavorites(FavoriteModel item);
  Future<void> removeFromFavorites(int index);
}

@Injectable(as: FavoritesLocalDataSource)
class FavoritesLocalDataSourceImpl implements FavoritesLocalDataSource {
  FavoritesLocalDataSourceImpl({required FavoritesCacheClient cacheClient}) : _cacheClient = cacheClient;

  final FavoritesCacheClient _cacheClient;

  @override
  Future<void> init() async {
    await _cacheClient.init();
  }

  @override
  List<FavoriteModel> getFavorites() {
    return _cacheClient.getAll() ?? <FavoriteModel>[];
  }

  @override
  Future<void> addToFavorites(FavoriteModel item) async {
    await _cacheClient.add(item);
  }

  @override
  Future<void> removeFromFavorites(int index) async {
    await _cacheClient.deleteAt(index);
  }
}
