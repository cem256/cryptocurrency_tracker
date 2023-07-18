import 'package:cryptocurrency_tracker/app/errors/failures/failure.dart';
import 'package:cryptocurrency_tracker/feature/search/data/datasources/remote/search_remote_datasource.dart';
import 'package:cryptocurrency_tracker/feature/search/data/models/search_model.dart';
import 'package:cryptocurrency_tracker/feature/search/data/repositories/search_repository_impl.dart';
import 'package:cryptocurrency_tracker/feature/search/domain/entities/search_entity.dart';
import 'package:cryptocurrency_tracker/feature/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

class MockSearchRemoteDataSource extends Mock implements SearchRemoteDataSource {}

class MockSearchModel extends Mock implements SearchModel {}

void main() {
  late MockSearchRemoteDataSource dataSource;
  late SearchRepository repository;
  late List<MockSearchModel> mockSearchModel;
  late String query;

  setUp(() {
    dataSource = MockSearchRemoteDataSource();
    repository = SearchRepositoryImpl(remoteDataSource: dataSource);
    mockSearchModel = List.generate(50, (_) => MockSearchModel());
    query = 'btc';
  });

  test('Should return List of SearchEntities when there is no exception', () async {
    when(() => dataSource.search(query: query)).thenAnswer((_) async => mockSearchModel);
    final result = await repository.search(query: query);

    verify(() => dataSource.search(query: query));

    expect(result, isA<Right<Failure, List<SearchEntity>>>());
  });

  test('Should return  Failure when an exception caught', () async {
    when(() => dataSource.search(query: query)).thenThrow(Exception());
    final result = await repository.search(query: query);

    verify(() => dataSource.search(query: query));

    expect(result, isA<Left<Failure, List<SearchEntity>>>());
  });
}
