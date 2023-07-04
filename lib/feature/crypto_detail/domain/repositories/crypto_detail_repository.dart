import 'package:cryptocurrency_tracker/core/models/failure/failure_model.dart';
import 'package:cryptocurrency_tracker/feature/crypto_detail/domain/entities/crypto_detail_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class CryptoDetailRepository {
  Future<Either<FailureModel, CryptoDetailEntity>> getDetail({required String id});
}
