import 'package:cryptocurrency_tracker/app/constants/cache_constants.dart';
import 'package:cryptocurrency_tracker/core/clients/cache/primitive_cache_client_interface.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class SplashCacheClient extends PrimitiveCacheClientInterface<bool> {
  @override
  String get boxName => CacheConstants.onboardingBox;
}
