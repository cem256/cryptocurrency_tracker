// ignore_for_file: one_member_abstracts

import 'package:crypto_app/core/models/failure/failure_model.dart';
import 'package:crypto_app/feature/search/domain/entities/search_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepository {
  Future<Either<FailureModel, List<SearchEntity>>> search({required String query});
}
