import 'package:cryptocurrency_tracker/app/errors/exceptions/exceptions.dart';
import 'package:cryptocurrency_tracker/app/errors/failures/failure.dart';
import 'package:cryptocurrency_tracker/feature/crypto/data/datasources/remote/crypto_remote_data_source.dart';
import 'package:cryptocurrency_tracker/feature/crypto/data/models/crypto_model.dart';
import 'package:cryptocurrency_tracker/feature/crypto/domain/entities/crypto_entity.dart';
import 'package:cryptocurrency_tracker/feature/crypto/domain/repositores/crypto_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CryptoRepository)
final class CryptoRepositoryImpl implements CryptoRepository {
  CryptoRepositoryImpl({required CryptoRemoteDataSource remoteDataSource}) : _remoteDataSource = remoteDataSource;

  final CryptoRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<CryptoEntity>>> getAllCryptocurrencies({
    required int page,
    required int perPage,
  }) async {
    try {
      final result = await _remoteDataSource.getAllCryptocurrencies(page: page, perPage: perPage);
      return right(result.map((e) => e.toCryptoEntity()).toList());
    } on DioException {
      return left(const Failure.networkFailure());
    } on NullResponseException {
      return left(const Failure.nullResponseFaiure());
    } catch (e) {
      debugPrint('ERROR: Method getAllCryptocurrencies MESSAGE: $e');
      return left(const Failure.unknownFailure());
    }
  }
}
