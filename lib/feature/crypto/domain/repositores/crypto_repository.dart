import 'package:cryptocurrency_tracker/app/errors/failures/failure.dart';
import 'package:cryptocurrency_tracker/feature/crypto/domain/entities/crypto_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class CryptoRepository {
  Future<Either<Failure, List<CryptoEntity>>> getAllCryptocurrencies({required int page, required int perPage});
}
