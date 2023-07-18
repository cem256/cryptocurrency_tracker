import 'package:cryptocurrency_tracker/app/errors/failures/failure.dart';
import 'package:cryptocurrency_tracker/feature/search/domain/entities/search_entity.dart';
import 'package:dartz/dartz.dart';

/// [SearchRepository] is a contract class which defines the methods
/// that any implementation of [SearchRepository] must implement.
abstract interface class SearchRepository {
  Future<Either<Failure, List<SearchEntity>>> search({required String query});
}
