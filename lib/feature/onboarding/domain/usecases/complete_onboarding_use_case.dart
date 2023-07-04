import 'package:crypto_app/feature/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UCCompleteOnboarding {
  UCCompleteOnboarding({
    required OnboardingRepository onboardingRepository,
  }) : _onboardingRepository = onboardingRepository;

  final OnboardingRepository _onboardingRepository;

  Future<void> execute() async {
    return _onboardingRepository.completeOnboarding();
  }
}
