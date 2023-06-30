import 'package:crypto_app/core/models/failure/failure_model.dart';
import 'package:crypto_app/feature/search/domain/entities/search_entity.dart';
import 'package:crypto_app/feature/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class UCSearch {
  UCSearch({required SearchRepository repository}) : _repository = repository;

  final SearchRepository _repository;

  Future<Either<FailureModel, List<SearchEntity>>> execute({required String query}) {
    return _repository.search(query: query);
  }
}
