import 'package:cryptocurrency_tracker/app/errors/failures/failure.dart';
import 'package:cryptocurrency_tracker/feature/crypto/domain/entities/crypto_entity.dart';
import 'package:cryptocurrency_tracker/feature/crypto/domain/repositores/crypto_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class UCGetAllCryptocurrencies {
  UCGetAllCryptocurrencies({required CryptoRepository cryptoRepository}) : _cryptoRepository = cryptoRepository;

  final CryptoRepository _cryptoRepository;

  Future<Either<Failure, List<CryptoEntity>>> execute({required int page, required int perPage}) {
    return _cryptoRepository.getAllCryptocurrencies(page: page, perPage: perPage);
  }
}
