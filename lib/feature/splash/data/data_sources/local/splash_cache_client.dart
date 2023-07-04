import 'package:crypto_app/app/constants/cache_constants.dart';
import 'package:crypto_app/core/clients/cache/primitive_cache_client_interface.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class SplashCacheClient extends PrimitiveCacheClientInterface<bool> {
  @override
  String get boxName => CacheConstants.onboardingBox;
}
