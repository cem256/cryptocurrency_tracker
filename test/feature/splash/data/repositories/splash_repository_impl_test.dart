import 'package:cryptocurrency_tracker/feature/splash/data/data_sources/local/splash_local_data_source.dart';
import 'package:cryptocurrency_tracker/feature/splash/data/repositories/splash_repository_impl.dart';
import 'package:cryptocurrency_tracker/feature/splash/domain/repositories/splash_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSplashLocalDataSource extends Mock implements SplashLocalDataSource {}

void main() {
  group('Splash RepositoryImpl', () {
    late MockSplashLocalDataSource dataSource;
    late SplashRepository repository;

    setUp(() {
      dataSource = MockSplashLocalDataSource();
      repository = SplashRepositoryImpl(dataSource: dataSource);
    });

    test('Should return false when datasource returns false', () async {
      when(() => dataSource.getOnboardingValue()).thenAnswer((_) async => false);
      final result = await repository.checkIsOnboardingCompleted();
      expect(false, equals(result));
    });

    test('Should return true when dataSource returns true', () async {
      when(() => dataSource.getOnboardingValue()).thenAnswer((_) async => true);
      final result = await repository.checkIsOnboardingCompleted();
      expect(true, equals(result));
    });
  });
}
