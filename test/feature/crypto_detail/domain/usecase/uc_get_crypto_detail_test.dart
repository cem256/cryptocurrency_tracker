import 'package:cryptocurrency_tracker/core/models/failure/failure_model.dart';
import 'package:cryptocurrency_tracker/feature/crypto_detail/domain/entities/crypto_detail_entity.dart';
import 'package:cryptocurrency_tracker/feature/crypto_detail/domain/repositories/crypto_detail_repository.dart';
import 'package:cryptocurrency_tracker/feature/crypto_detail/domain/usecases/uc_get_crypto_detail.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

class MockCryptoDetailRepository extends Mock implements CryptoDetailRepository {}

class MockCryptoDetailEntity extends Mock implements CryptoDetailEntity {}

void main() {
  late MockCryptoDetailRepository repository;
  late UCGetCryptoDetail uc;
  late MockCryptoDetailEntity mockCryptoDetailEntity;
  late String id;

  setUp(() {
    repository = MockCryptoDetailRepository();
    uc = UCGetCryptoDetail(repository: repository);
    mockCryptoDetailEntity = MockCryptoDetailEntity();
    id = 'btc';
  });

  group('UCGetCryptoDetail', () {
    test('Should return CryptoDetailEntity when there is no exception caught', () async {
      when(() => repository.getDetail(id: id)).thenAnswer((_) async => Right(mockCryptoDetailEntity));
      final result = await uc.execute(id: id);

      verify(() => uc.execute(id: id));
      expect(result, isA<Right<FailureModel, CryptoDetailEntity>>());
    });

    test('Should return FailureModel type of object when an exception caught', () async {
      when(() => repository.getDetail(id: id)).thenAnswer((_) async => const Left(FailureModel()));
      final result = await uc.execute(id: id);

      verify(() => uc.execute(id: id));
      expect(result, isA<Left<FailureModel, CryptoDetailEntity>>());
    });
  });
}
