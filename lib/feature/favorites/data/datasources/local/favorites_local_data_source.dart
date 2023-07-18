import 'package:cryptocurrency_tracker/feature/favorites/data/datasources/local/favorites_cache_client.dart';
import 'package:cryptocurrency_tracker/feature/favorites/data/models/favorite_model.dart';
import 'package:injectable/injectable.dart';

/// [FavoritesLocalDataSource] is a contract class which defines the methods
/// that any implementation of [FavoritesLocalDataSource] must implement.
abstract interface class FavoritesLocalDataSource {
  Future<void> init();
  List<FavoriteModel> getFavorites();
  Future<void> addToFavorites(FavoriteModel item);
  Future<void> removeFromFavorites(int index);
}

@Injectable(as: FavoritesLocalDataSource)
final class FavoritesLocalDataSourceImpl implements FavoritesLocalDataSource {
  FavoritesLocalDataSourceImpl({required FavoritesCacheClient cacheClient}) : _cacheClient = cacheClient;

  final FavoritesCacheClient _cacheClient;

  @override
  // Initializes the cache. Before using the cache, this method must be called.
  Future<void> init() async {
    await _cacheClient.init();
  }

  @override
  // Returns a list of [FavoriteModel] from the cache. If the cache is empty,
  // returns an empty list.
  List<FavoriteModel> getFavorites() {
    return _cacheClient.getAll() ?? <FavoriteModel>[];
  }

  @override
  // Adds a [FavoriteModel] to the cache.
  Future<void> addToFavorites(FavoriteModel item) async {
    await _cacheClient.add(item);
  }

  @override
  // Removes a [MangaEntity] from the cache.
  Future<void> removeFromFavorites(int index) async {
    await _cacheClient.deleteAt(index);
  }
}
