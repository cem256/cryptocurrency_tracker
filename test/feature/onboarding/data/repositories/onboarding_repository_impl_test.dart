import 'package:cryptocurrency_tracker/feature/onboarding/data/datasources/local/onboarding_local_data_source.dart';
import 'package:cryptocurrency_tracker/feature/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'onboarding_repository_impl_test.mocks.dart';

@GenerateMocks([OnboardingLocalDataSource])
void main() {
  late MockOnboardingLocalDataSource dataSource;
  late OnboardingRepositoryImpl repository;

  setUp(() {
    dataSource = MockOnboardingLocalDataSource();
    repository = OnboardingRepositoryImpl(onboardingLocalDataSource: dataSource);
  });

  test('Completes onboarding by calling dataSource.completeOnboarding', () async {
    when(dataSource.completeOnboarding()).thenAnswer((_) async {});

    await repository.completeOnboarding();

    verify(dataSource.completeOnboarding()).called(1);
  });
}
