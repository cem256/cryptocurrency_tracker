import 'package:cryptocurrency_tracker/core/models/failure/failure_model.dart';
import 'package:cryptocurrency_tracker/feature/crypto/domain/entities/crypto_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class CryptoRepository {
  Future<Either<FailureModel, List<CryptoEntity>>> getAllCryptocurrencies({required int page, required int perPage});
}
