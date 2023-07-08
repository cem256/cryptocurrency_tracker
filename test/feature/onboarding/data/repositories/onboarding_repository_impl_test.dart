import 'package:cryptocurrency_tracker/feature/onboarding/data/datasources/local/onboarding_local_data_source.dart';
import 'package:cryptocurrency_tracker/feature/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:cryptocurrency_tracker/feature/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockOnboardingLocalDataSource extends Mock implements OnboardingLocalDataSource {}

void main() {
  late MockOnboardingLocalDataSource dataSource;
  late OnboardingRepository repository;

  setUp(() {
    dataSource = MockOnboardingLocalDataSource();
    repository = OnboardingRepositoryImpl(onboardingLocalDataSource: dataSource);
  });

  test('Completes onboarding by calling dataSource.completeOnboarding', () async {
    when(() => dataSource.completeOnboarding()).thenAnswer((_) async {});

    await repository.completeOnboarding();

    verify(() => dataSource.completeOnboarding()).called(1);
  });
}
