import 'package:cryptocurrency_tracker/feature/splash/domain/repositories/splash_repository.dart';
import 'package:cryptocurrency_tracker/feature/splash/domain/usecases/uc_check_is_onboarding_completed.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSplashRepository extends Mock implements SplashRepository {}

void main() {
  late UCCheckIsOnboardingCompleted uc;
  late MockSplashRepository repository;

  setUp(() {
    repository = MockSplashRepository();
    uc = UCCheckIsOnboardingCompleted(repository: repository);
  });
  test('Should return false when repository returns false', () async {
    when(() => repository.checkIsOnboardingCompleted()).thenAnswer((_) async => false);
    final result = await uc.execute();
    expect(false, equals(result));
  });

  test('Should return true when repository returns true', () async {
    when(() => repository.checkIsOnboardingCompleted()).thenAnswer((_) async => true);
    final result = await uc.execute();
    expect(true, equals(result));
  });
}
