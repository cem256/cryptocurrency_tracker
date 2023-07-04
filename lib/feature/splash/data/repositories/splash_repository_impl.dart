import 'package:cryptocurrency_tracker/feature/splash/data/data_sources/local/splash_local_data_source.dart';
import 'package:cryptocurrency_tracker/feature/splash/domain/repositories/splash_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SplashRepository)
class SplashRepositoryImpl implements SplashRepository {
  SplashRepositoryImpl({required SplashLocalDataSource dataSource}) : _dataSource = dataSource;

  final SplashLocalDataSource _dataSource;
  @override
  Future<bool> checkIsOnboardingCompleted() async {
    return await _dataSource.getOnboardingValue() ?? false;
  }
}
