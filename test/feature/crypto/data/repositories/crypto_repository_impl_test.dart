import 'package:cryptocurrency_tracker/core/models/failure/failure_model.dart';
import 'package:cryptocurrency_tracker/feature/crypto/data/datasources/remote/crypto_remote_data_source.dart';
import 'package:cryptocurrency_tracker/feature/crypto/data/models/crypto_model.dart';
import 'package:cryptocurrency_tracker/feature/crypto/data/repositories/crypto_repository_impl.dart';
import 'package:cryptocurrency_tracker/feature/crypto/domain/entities/crypto_entity.dart';
import 'package:cryptocurrency_tracker/feature/crypto/domain/repositores/crypto_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

class MockCryptoRemoteDataSource extends Mock implements CryptoRemoteDataSource {}

class MockCryptoModel extends Mock implements CryptoModel {}

void main() {
  late MockCryptoRemoteDataSource dataSource;
  late CryptoRepository repository;
  late List<MockCryptoModel> mockCryptoModel;
  late int page;
  late int perPage;

  setUp(() {
    page = 1;
    perPage = 50;
    dataSource = MockCryptoRemoteDataSource();
    repository = CryptoRepositoryImpl(remoteDataSource: dataSource);
    mockCryptoModel = List.generate(perPage, (_) => MockCryptoModel());
  });

  test('Should return List of CryptoEntities when there is no exception', () async {
    when(() => dataSource.getAllCryptocurrencies(page: page, perPage: perPage))
        .thenAnswer((_) async => mockCryptoModel);
    final result = await repository.getAllCryptocurrencies(page: page, perPage: perPage);

    verify(() => dataSource.getAllCryptocurrencies(page: page, perPage: perPage));

    expect(result, isA<Right<FailureModel, List<CryptoEntity>>>());
  });

  test('Should return  FailureModel when an exception caught', () async {
    when(() => dataSource.getAllCryptocurrencies(page: page, perPage: perPage)).thenThrow(Exception());
    final result = await repository.getAllCryptocurrencies(page: page, perPage: perPage);

    verify(() => dataSource.getAllCryptocurrencies(page: page, perPage: perPage));

    expect(result, isA<Left<FailureModel, List<CryptoEntity>>>());
  });
}
