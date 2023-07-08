import 'package:cryptocurrency_tracker/core/models/failure/failure_model.dart';
import 'package:cryptocurrency_tracker/feature/favorites/data/datasources/local/favorites_local_data_source.dart';
import 'package:cryptocurrency_tracker/feature/favorites/data/models/favorite_model.dart';
import 'package:cryptocurrency_tracker/feature/favorites/data/repositories/favorites_repository_impl.dart';
import 'package:cryptocurrency_tracker/feature/favorites/domain/models/favorite_entity.dart';
import 'package:cryptocurrency_tracker/feature/favorites/domain/repositories/favorites_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

class MockFavoriteLocalDataSource extends Mock implements FavoritesLocalDataSource {}

class MockFavoriteModel extends Mock implements FavoriteModel {}

class MockFavoriteEntity extends Mock implements FavoriteEntity {}

void main() {
  late MockFavoriteLocalDataSource dataSource;
  late FavoritesRepository repository;
  late List<MockFavoriteModel> mockFavoriteModel;

  setUp(() {
    dataSource = MockFavoriteLocalDataSource();
    repository = FavoritesRepositoryImpl(dataSource: dataSource);
    mockFavoriteModel = List.generate(50, (_) => MockFavoriteModel());
  });

  test('Should return List of FavoriteEntities when there is no exception', () async {
    when(() => dataSource.init()).thenAnswer((_) async => {});
    when(() => dataSource.getFavorites()).thenReturn(mockFavoriteModel);
    final result = repository.getFavorites();

    verify(() => dataSource.getFavorites());

    expect(result, isA<Right<FailureModel, List<FavoriteEntity>>>());
  });

  test('Should return  FailureModel when an exception caught', () async {
    when(() => dataSource.init()).thenAnswer((_) async => {});
    when(() => dataSource.getFavorites()).thenThrow(Exception());
    final result = repository.getFavorites();

    verify(() => dataSource.getFavorites());

    expect(result, isA<Left<FailureModel, List<FavoriteEntity>>>());
  });
}
