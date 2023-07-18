import 'package:cryptocurrency_tracker/app/constants/cache_constants.dart';
import 'package:cryptocurrency_tracker/feature/splash/data/data_sources/local/splash_cache_client.dart';
import 'package:injectable/injectable.dart';

/// [SplashLocalDataSource] is a contract class which defines the methods
/// that any implementation of [SplashLocalDataSource] must implement.
abstract interface class SplashLocalDataSource {
  Future<bool?> getOnboardingValue();
}

@Injectable(as: SplashLocalDataSource)
final class SplashLocalDataSourceImpl implements SplashLocalDataSource {
  SplashLocalDataSourceImpl({required SplashCacheClient cacheClient}) : _cacheClient = cacheClient;

  final SplashCacheClient _cacheClient;

  @override
  Future<bool?> getOnboardingValue() async {
    await _cacheClient.init();
    final response = await _cacheClient.get(CacheConstants.onboardingKey);
    return response;
  }
}
