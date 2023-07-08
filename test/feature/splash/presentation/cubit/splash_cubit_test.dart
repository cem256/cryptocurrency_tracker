import 'package:bloc_test/bloc_test.dart';
import 'package:cryptocurrency_tracker/feature/splash/domain/usecases/uc_check_is_onboarding_completed.dart';
import 'package:cryptocurrency_tracker/feature/splash/presentation/cubit/splash_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUCCheckIsOnboardingCompleted extends Mock implements UCCheckIsOnboardingCompleted {}

void main() {
  group('Splash Cubit Test', () {
    late MockUCCheckIsOnboardingCompleted uc;
    late SplashCubit splashCubit;

    setUp(() {
      uc = MockUCCheckIsOnboardingCompleted();
      splashCubit = SplashCubit(uc: uc);
    });

    tearDown(() {
      splashCubit.close();
    });

    test('initial state is SplashState()', () {
      expect(splashCubit.state, const SplashState());
    });

    blocTest<SplashCubit, SplashState>(
      'emits [] when nothing is added',
      build: () => splashCubit,
      expect: () => <void>[],
    );

    blocTest<SplashCubit, SplashState>(
      'emits [SplashState(isOnboardingCompleted: false)] when UCCheckIsOnboardingCompleted returns false ',
      build: () {
        when(() => uc.execute()).thenAnswer((_) async => false);
        return splashCubit;
      },
      act: (bloc) => splashCubit.checkIsOnboardingCompleted(),
      expect: () => [const SplashState(isOnboardingCompleted: false)],
    );

    blocTest<SplashCubit, SplashState>(
      'emits [SplashState(isOnboardingCompleted: true)] when UCCheckIsOnboardingCompleted returns true ',
      build: () {
        when(() => uc.execute()).thenAnswer((_) async => true);
        return splashCubit;
      },
      act: (bloc) => splashCubit.checkIsOnboardingCompleted(),
      expect: () => [const SplashState(isOnboardingCompleted: true)],
    );
  });
}
