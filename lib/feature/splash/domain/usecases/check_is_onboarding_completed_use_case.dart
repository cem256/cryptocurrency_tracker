import 'package:crypto_app/feature/splash/domain/repositories/splash_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UCCheckIsOnboardingCompleted {
  UCCheckIsOnboardingCompleted({
    required SplashRepository repository,
  }) : _repository = repository;

  final SplashRepository _repository;

  Future<bool> execute() {
    return _repository.checkIsOnboardingCompleted();
  }
}
