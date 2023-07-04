import 'package:crypto_app/app/constants/cache_constants.dart';
import 'package:crypto_app/feature/splash/data/data_sources/local/splash_cache_client.dart';

import 'package:injectable/injectable.dart';

abstract interface class SplashLocalDataSource {
  Future<bool?> getOnboardingValue();
}

@Injectable(as: SplashLocalDataSource)
class SplashLocalDataSourceImpl implements SplashLocalDataSource {
  SplashLocalDataSourceImpl({required SplashCacheClient cacheClient}) : _cacheClient = cacheClient;

  final SplashCacheClient _cacheClient;

  @override
  Future<bool?> getOnboardingValue() async {
    await _cacheClient.init();
    final response = await _cacheClient.get(CacheConstants.onboardingKey);
    return response;
  }
}
