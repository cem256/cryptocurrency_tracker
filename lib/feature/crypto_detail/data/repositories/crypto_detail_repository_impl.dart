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
  Future<Either<Failure, CryptoDetailEntity>> getDetail({required String id}) async {
    try {
      final result = await _remoteDataSource.getDetail(id: id);
      return right(result.toCryptoDetailEntity());
    } on DioException {
      return left(const Failure.networkFailure());
    } on NullResponseException {
      return left(const Failure.nullResponseFaiure());
    } catch (e) {
      debugPrint('ERROR: Method getDetail MESSAGE: $e');
      return left(const Failure.unknownFailure());
    }
  }
}
