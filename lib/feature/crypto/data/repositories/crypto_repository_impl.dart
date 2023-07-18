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
  // Gets list of cryptocurrencies from the remote data source. and returns a list of [CryptoEntity] or a [Failure].
  Future<Either<Failure, List<CryptoEntity>>> getAllCryptocurrencies({
    required int page,
    required int perPage,
  }) async {
    try {
      // Get list of [CryptoModel] from the remote data source.
      final result = await _remoteDataSource.getAllCryptocurrencies(page: page, perPage: perPage);
      return right(result.map((e) => e.toCryptoEntity()).toList());
      // On DioException, return a [Failure.networkFailure].
    } on DioException {
      return left(const Failure.networkFailure());
      // On NullResponseException, return a [ Failure.nullResponseFaiure].
    } on NullResponseException {
      return left(const Failure.nullResponseFaiure());
      // On any other exception, return a [Failure.unknownFailure] and print the error.
    } catch (e) {
      debugPrint('ERROR: Method getAllCryptocurrencies MESSAGE: $e');
      return left(const Failure.unknownFailure());
    }
  }
}
