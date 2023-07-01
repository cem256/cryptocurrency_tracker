import 'package:crypto_app/core/models/failure/failure_model.dart';
import 'package:crypto_app/feature/crypto_detail/domain/entities/crypto_detail_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CryptoDetailRepository {
  Future<Either<FailureModel, CryptoDetailEntity>> getDetail({required String id});
}
