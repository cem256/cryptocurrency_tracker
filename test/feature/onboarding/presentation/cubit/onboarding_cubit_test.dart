import 'package:bloc_test/bloc_test.dart';
import 'package:cryptocurrency_tracker/feature/onboarding/domain/usecases/uc_complete_onboarding.dart';
import 'package:cryptocurrency_tracker/feature/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'onboarding_cubit_test.mocks.dart';

@GenerateMocks([UCCompleteOnboarding])
void main() {
  group('Onboarding Cubit Test', () {
    late MockUCCompleteOnboarding uc;
    late OnboardingCubit onboardingCubit;
    late int tPageIndex;

    setUp(() {
      uc = MockUCCompleteOnboarding();
      onboardingCubit = OnboardingCubit(uc: uc);
      tPageIndex = 1;
    });

    tearDown(() {
      onboardingCubit.close();
    });

    test('initial state is OnboardingState()', () {
      expect(onboardingCubit.state, const OnboardingState());
    });

    blocTest<OnboardingCubit, OnboardingState>(
      'emits [] when nothing is added',
      build: () => onboardingCubit,
      expect: () => <void>[],
    );

    blocTest<OnboardingCubit, OnboardingState>(
      'emits [OnboardingState(pageIndex: tPageIndex ) when onboardingCubit.changePageIndex(tPageIndex) called ]',
      build: () => onboardingCubit,
      act: (bloc) => onboardingCubit.changePageIndex(tPageIndex),
      expect: () => [OnboardingState(pageIndex: tPageIndex)],
    );
  });
}
