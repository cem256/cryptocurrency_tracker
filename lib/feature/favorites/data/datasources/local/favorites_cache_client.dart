import 'package:cryptocurrency_tracker/app/constants/cache_constants.dart';
import 'package:cryptocurrency_tracker/core/clients/cache/cache_client_interface.dart';
import 'package:cryptocurrency_tracker/feature/favorites/data/models/favorite_model.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';

@Injectable()
final class FavoritesCacheClient extends CacheClientInterface<FavoriteModel> {
  @override
  String get boxName => CacheConstants.favoritesBox;

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(CacheConstants.favoritesTypeID)) {
      Hive.registerAdapter(FavoriteModelAdapter());
    }
  }
}
