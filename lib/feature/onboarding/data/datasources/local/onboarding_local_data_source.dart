import 'package:cryptocurrency_tracker/app/constants/cache_constants.dart';
import 'package:cryptocurrency_tracker/feature/onboarding/data/datasources/local/onboarding_cache_client.dart';
import 'package:injectable/injectable.dart';

/// [OnboardingLocalDataSource] is a contract class which defines the methods
/// that any implementation of [OnboardingLocalDataSource] must implement.
abstract interface class OnboardingLocalDataSource {
  Future<void> completeOnboarding();
}

@Injectable(as: OnboardingLocalDataSource)
final class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  OnboardingLocalDataSourceImpl({required OnboardingCacheClient cacheClient}) : _cacheClient = cacheClient;

  final OnboardingCacheClient _cacheClient;

  @override
  // Sets the onboarding flag to true in the cache
  Future<void> completeOnboarding() async {
    await _cacheClient.init();
    await _cacheClient.put(CacheConstants.onboardingKey, true);
  }
}
