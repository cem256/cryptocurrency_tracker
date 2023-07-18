import 'package:cryptocurrency_tracker/app/constants/cache_constants.dart';
import 'package:cryptocurrency_tracker/core/clients/cache/cache_client_interface.dart';
import 'package:injectable/injectable.dart';

@Injectable()

/// Cache client for splash
final class SplashCacheClient extends CacheClientInterface<bool> {
  @override
  String get boxName => CacheConstants.onboardingBox;

  @override
  void registerAdapters() {}
}
