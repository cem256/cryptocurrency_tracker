import 'package:cryptocurrency_tracker/app/errors/failures/failure.dart';
import 'package:cryptocurrency_tracker/feature/crypto/domain/entities/crypto_entity.dart';
import 'package:dartz/dartz.dart';

/// [CryptoRepository] is a contract class which defines the methods
/// that any implementation of [CryptoRepository] must implement.
abstract interface class CryptoRepository {
  Future<Either<Failure, List<CryptoEntity>>> getAllCryptocurrencies({required int page, required int perPage});
}
