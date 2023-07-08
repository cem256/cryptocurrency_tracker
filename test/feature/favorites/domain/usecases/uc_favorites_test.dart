import 'package:cryptocurrency_tracker/core/models/failure/failure_model.dart';
import 'package:cryptocurrency_tracker/feature/favorites/domain/models/favorite_entity.dart';
import 'package:cryptocurrency_tracker/feature/favorites/domain/repositories/favorites_repository.dart';
import 'package:cryptocurrency_tracker/feature/favorites/domain/usecases/uc_favorites.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

class MockFavoriteRepository extends Mock implements FavoritesRepository {}

class MockFavoriteEntity extends Mock implements FavoriteEntity {}

void main() {
  late MockFavoriteRepository repository;
  late UCFavorites uc;
  late List<MockFavoriteEntity> mockFavoriteEntity;

  setUp(() {
    repository = MockFavoriteRepository();
    uc = UCFavorites(repository: repository);
    mockFavoriteEntity = List.generate(50, (_) => MockFavoriteEntity());
  });

  group('UCFavorites', () {
    test('Should return list of FavoriteEntities when there is no exception caught', () async {
      when(() => repository.getFavorites()).thenReturn(Right(mockFavoriteEntity));
      final result = uc.getFavorites();

      verify(() => uc.getFavorites());
      expect(result, isA<Right<FailureModel, List<FavoriteEntity>>>());
    });

    test('Should return FailureModel type of object when an exception caught', () async {
      when(() => repository.getFavorites()).thenReturn(const Left(FailureModel()));
      final result = uc.getFavorites();

      verify(() => uc.getFavorites());
      expect(result, isA<Left<FailureModel, List<FavoriteEntity>>>());
    });
  });
}
