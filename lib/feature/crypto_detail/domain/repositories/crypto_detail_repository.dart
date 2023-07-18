import 'package:cryptocurrency_tracker/app/errors/failures/failure.dart';
import 'package:cryptocurrency_tracker/feature/crypto_detail/domain/entities/crypto_detail_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class CryptoDetailRepository {
  Future<Either<Failure, CryptoDetailEntity>> getDetail({required String id});
}
