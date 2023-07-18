/// [SplashRepository] is a contract class which defines the methods
/// that any implementation of [SplashRepository] must implement.
abstract interface class SplashRepository {
  Future<bool> checkIsOnboardingCompleted();
}
