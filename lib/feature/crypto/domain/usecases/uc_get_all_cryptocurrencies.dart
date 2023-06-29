import 'package:crypto_app/app/shared/models/failure/failure_model.dart';
import 'package:crypto_app/feature/crypto/domain/entities/crypto_entity.dart';
import 'package:crypto_app/feature/crypto/domain/repositores/crypto_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class UCGetAllCryptocurrencies {
  UCGetAllCryptocurrencies({required CryptoRepository cryptoRepository}) : _cryptoRepository = cryptoRepository;

  final CryptoRepository _cryptoRepository;

  Future<Either<FailureModel, List<CryptoEntity>>> execute({required int page, required int perPage}) {
    return _cryptoRepository.getAllCryptocurrencies(page: page, perPage: perPage);
  }
}
