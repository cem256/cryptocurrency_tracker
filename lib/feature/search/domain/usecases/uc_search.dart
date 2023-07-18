import 'package:cryptocurrency_tracker/app/errors/failures/failure.dart';
import 'package:cryptocurrency_tracker/feature/search/domain/entities/search_entity.dart';
import 'package:cryptocurrency_tracker/feature/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class UCSearch {
  UCSearch({required SearchRepository repository}) : _repository = repository;

  final SearchRepository _repository;

  Future<Either<Failure, List<SearchEntity>>> execute({required String query}) {
    return _repository.search(query: query);
  }
}
