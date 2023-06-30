// ignore_for_file: one_member_abstracts

import 'package:crypto_app/core/models/failure/failure_model.dart';
import 'package:crypto_app/feature/crypto/domain/entities/crypto_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CryptoRepository {
  Future<Either<FailureModel, List<CryptoEntity>>> getAllCryptocurrencies({required int page, required int perPage});
}
