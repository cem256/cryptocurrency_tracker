import 'package:cryptocurrency_tracker/feature/onboarding/data/datasources/local/onboarding_local_data_source.dart';
import 'package:cryptocurrency_tracker/feature/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OnboardingRepository)
class OnboardingRepositoryImpl implements OnboardingRepository {
  OnboardingRepositoryImpl({required OnboardingLocalDataSource onboardingLocalDataSource})
      : _onboardingLocalDataSource = onboardingLocalDataSource;

  final OnboardingLocalDataSource _onboardingLocalDataSource;

  @override
  Future<void> completeOnboarding() async {
    await _onboardingLocalDataSource.completeOnboarding();
  }
}
