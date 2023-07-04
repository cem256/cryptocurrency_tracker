import 'package:cryptocurrency_tracker/core/models/failure/failure_model.dart';
import 'package:cryptocurrency_tracker/feature/search/domain/entities/search_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class SearchRepository {
  Future<Either<FailureModel, List<SearchEntity>>> search({required String query});
}
