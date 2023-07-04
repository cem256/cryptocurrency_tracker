import 'package:cryptocurrency_tracker/app/constants/cache_constants.dart';
import 'package:cryptocurrency_tracker/feature/onboarding/data/datasources/local/onboarding_cache_client.dart';
import 'package:injectable/injectable.dart';

abstract interface class OnboardingLocalDataSource {
  Future<void> completeOnboarding();
}

@Injectable(as: OnboardingLocalDataSource)
class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  OnboardingLocalDataSourceImpl({required OnboardingCacheClient cacheClient}) : _cacheClient = cacheClient;

  final OnboardingCacheClient _cacheClient;

  @override
  Future<void> completeOnboarding() async {
    await _cacheClient.init();
    await _cacheClient.put(CacheConstants.onboardingKey, true);
  }
}
