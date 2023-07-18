import 'package:cryptocurrency_tracker/app/errors/failures/failure.dart';
import 'package:cryptocurrency_tracker/feature/crypto_detail/data/datasources/remote/crypto_detail_remote_datasource.dart';
import 'package:cryptocurrency_tracker/feature/crypto_detail/data/models/crypto_detail_model.dart';
import 'package:cryptocurrency_tracker/feature/crypto_detail/data/repositories/crypto_detail_repository_impl.dart';
import 'package:cryptocurrency_tracker/feature/crypto_detail/domain/entities/crypto_detail_entity.dart';
import 'package:cryptocurrency_tracker/feature/crypto_detail/domain/repositories/crypto_detail_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCryptoDetailRemoteDataSource extends Mock implements CryptoDetailRemoteDataSource {}

class MockCryptoDetailModel extends Mock implements CryptoDetailModel {}

void main() {
  late MockCryptoDetailRemoteDataSource dataSource;
  late CryptoDetailRepository repository;
  late MockCryptoDetailModel mockCryptoDetailModel;
  late String id;

  setUp(() {
    dataSource = MockCryptoDetailRemoteDataSource();
    repository = CryptoDetailRepositoryImpl(remoteDataSource: dataSource);
    mockCryptoDetailModel = MockCryptoDetailModel();
    id = 'btc';
  });

  test('Should return CryptoDetailEntity when there is no exception', () async {
    when(() => dataSource.getDetail(id: id)).thenAnswer((_) async => mockCryptoDetailModel);
    final result = await repository.getDetail(id: id);

    verify(() => dataSource.getDetail(id: id));

    expect(result, isA<Right<Failure, CryptoDetailEntity>>());
  });

  test('Should return  Failure when an exception caught', () async {
    when(() => dataSource.getDetail(id: id)).thenThrow(Exception());
    final result = await repository.getDetail(id: id);

    verify(() => dataSource.getDetail(id: id));

    expect(result, isA<Left<Failure, CryptoDetailEntity>>());
  });
}
