import 'package:cryptocurrency_tracker/app/errors/failures/failure.dart';
import 'package:cryptocurrency_tracker/feature/search/domain/entities/search_entity.dart';
import 'package:cryptocurrency_tracker/feature/search/domain/repositories/search_repository.dart';
import 'package:cryptocurrency_tracker/feature/search/domain/usecases/uc_search.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

class MockSearchRepository extends Mock implements SearchRepository {}

class MockSearchEntity extends Mock implements SearchEntity {}

void main() {
  late MockSearchRepository repository;
  late UCSearch uc;
  late List<MockSearchEntity> mockSearchEntity;
  late String query;

  setUp(() {
    repository = MockSearchRepository();
    uc = UCSearch(repository: repository);
    mockSearchEntity = List.generate(50, (_) => MockSearchEntity());
    query = 'btc';
  });

  group('UCSearch', () {
    test('Should return list of SearchEntities when there is no exception caught', () async {
      when(() => repository.search(query: query)).thenAnswer((_) async => Right(mockSearchEntity));
      final result = await uc.execute(query: query);

      verify(() => uc.execute(query: query));
      expect(result, isA<Right<Failure, List<SearchEntity>>>());
    });

    test('Should return Failure type of object when an exception caught', () async {
      when(() => repository.search(query: query)).thenAnswer((_) async => const Left(Failure.unknownFailure()));
      final result = await uc.execute(query: query);

      verify(() => uc.execute(query: query));
      expect(result, isA<Left<Failure, List<SearchEntity>>>());
    });
  });
}
