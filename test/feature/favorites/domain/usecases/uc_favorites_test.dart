import 'package:cryptocurrency_tracker/app/errors/failures/failure.dart';
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
      expect(result, isA<Right<Failure, List<FavoriteEntity>>>());
    });

    test('Should return Failure type of object when an exception caught', () async {
      when(() => repository.getFavorites()).thenReturn(const Left(Failure.unknownFailure()));
      final result = uc.getFavorites();

      verify(() => uc.getFavorites());
      expect(result, isA<Left<Failure, List<FavoriteEntity>>>());
    });
  });
}
