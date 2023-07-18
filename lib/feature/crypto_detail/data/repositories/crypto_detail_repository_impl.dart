import 'package:cryptocurrency_tracker/app/errors/exceptions/exceptions.dart';
import 'package:cryptocurrency_tracker/app/errors/failures/failure.dart';
import 'package:cryptocurrency_tracker/feature/crypto_detail/data/datasources/remote/crypto_detail_remote_datasource.dart';
import 'package:cryptocurrency_tracker/feature/crypto_detail/data/models/crypto_detail_model.dart';
import 'package:cryptocurrency_tracker/feature/crypto_detail/domain/entities/crypto_detail_entity.dart';
import 'package:cryptocurrency_tracker/feature/crypto_detail/domain/repositories/crypto_detail_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CryptoDetailRepository)
final class CryptoDetailRepositoryImpl implements CryptoDetailRepository {
  CryptoDetailRepositoryImpl({required CryptoDetailRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  final CryptoDetailRemoteDataSource _remoteDataSource;

  @override
  // Gets a [CryptoDetailModel] from the remote data source. and returns a [CryptoDetailEntity] or a [Failure].
  Future<Either<Failure, CryptoDetailEntity>> getDetail({required String id}) async {
    try {
      // Get a [CryptoDetailModel] from the remote data source.
      final result = await _remoteDataSource.getDetail(id: id);
      // Map the list of [CryptoDetailModel] to a list of [CryptoDetailEntity].
      return right(result.toCryptoDetailEntity());
      // On DioException, return a [Failure.networkFailure].
    } on DioException {
      return left(const Failure.networkFailure());
      // On NullResponseException, return a [Failure.nullResponseFaiure].
    } on NullResponseException {
      return left(const Failure.nullResponseFaiure());
      // On any other exception, return a [Failure.unknownFailure] and print the error.
    } catch (e) {
      debugPrint('ERROR: Method getDetail MESSAGE: $e');
      return left(const Failure.unknownFailure());
    }
  }
}
