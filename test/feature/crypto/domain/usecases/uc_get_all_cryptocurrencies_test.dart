import 'package:cryptocurrency_tracker/core/models/failure/failure_model.dart';
import 'package:cryptocurrency_tracker/feature/crypto/domain/entities/crypto_entity.dart';
import 'package:cryptocurrency_tracker/feature/crypto/domain/repositores/crypto_repository.dart';
import 'package:cryptocurrency_tracker/feature/crypto/domain/usecases/uc_get_all_cryptocurrencies.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

class MockCryptoRepository extends Mock implements CryptoRepository {}

class MockCryptoEntity extends Mock implements CryptoEntity {}

void main() {
  late MockCryptoRepository repository;
  late UCGetAllCryptocurrencies uc;
  late List<MockCryptoEntity> mockCryptoEntity;
  late int page;
  late int perPage;

  setUp(() {
    page = 1;
    perPage = 50;
    repository = MockCryptoRepository();
    uc = UCGetAllCryptocurrencies(cryptoRepository: repository);
    mockCryptoEntity = List.generate(perPage, (_) => MockCryptoEntity());
  });

  group('UCGetAllCryptocurrencies', () {
    test('Should return list of CryptoEntities when there is no exception caught', () async {
      when(() => repository.getAllCryptocurrencies(page: page, perPage: perPage))
          .thenAnswer((_) async => Right(mockCryptoEntity));
      final result = await uc.execute(page: page, perPage: perPage);

      verify(() => uc.execute(page: page, perPage: perPage));
      expect(result, isA<Right<FailureModel, List<CryptoEntity>>>());
    });

    test('Should return FailureModel type of object when an exception caught', () async {
      when(() => repository.getAllCryptocurrencies(page: page, perPage: perPage))
          .thenAnswer((_) async => const Left(FailureModel()));
      final result = await uc.execute(page: page, perPage: perPage);

      verify(() => uc.execute(page: page, perPage: perPage));
      expect(result, isA<Left<FailureModel, List<CryptoEntity>>>());
    });
  });
}
