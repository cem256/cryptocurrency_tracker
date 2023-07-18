/// [OnboardingRepository] is a contract class which defines the methods
/// that any implementation of [OnboardingRepository] must implement.
abstract interface class OnboardingRepository {
  Future<void> completeOnboarding();
}
