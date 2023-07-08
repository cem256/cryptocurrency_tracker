import 'package:cryptocurrency_tracker/feature/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:cryptocurrency_tracker/feature/onboarding/domain/usecases/uc_complete_onboarding.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockOnboardingRepository extends Mock implements OnboardingRepository {}

void main() {
  late MockOnboardingRepository repository;
  late UCCompleteOnboarding uc;

  setUp(() {
    repository = MockOnboardingRepository();
    uc = UCCompleteOnboarding(onboardingRepository: repository);
  });

  test('Completes onboarding by calling repository.completeOnboarding', () async {
    when(() => repository.completeOnboarding()).thenAnswer((_) async {});

    await uc.execute();

    verify(() => repository.completeOnboarding()).called(1);
  });
}
