import 'package:cryptocurrency_tracker/app/errors/failures/failure.dart';
import 'package:cryptocurrency_tracker/feature/crypto_detail/domain/entities/crypto_detail_entity.dart';
import 'package:cryptocurrency_tracker/feature/crypto_detail/domain/repositories/crypto_detail_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class UCGetCryptoDetail {
  UCGetCryptoDetail({required CryptoDetailRepository repository}) : _repository = repository;

  final CryptoDetailRepository _repository;

  Future<Either<Failure, CryptoDetailEntity>> execute({required String id}) {
    return _repository.getDetail(id: id);
  }
}
