import 'package:crypto_app/core/models/failure/failure_model.dart';
import 'package:crypto_app/feature/search/domain/entities/search_entity.dart';
import 'package:crypto_app/feature/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class UCSearch {
  UCSearch({required SearchRepository searchRepository}) : _searchRepository = searchRepository;

  final SearchRepository _searchRepository;

  Future<Either<FailureModel, List<SearchEntity>>> execute({required String query}) {
    return _searchRepository.search(query: query);
  }
}
