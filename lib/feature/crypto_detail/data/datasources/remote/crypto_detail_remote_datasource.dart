import 'package:crypto_app/app/constants/api_constants.dart';
import 'package:crypto_app/core/clients/network/network_client.dart';

import 'package:crypto_app/feature/crypto_detail/data/models/crypto_detail_model.dart';
import 'package:injectable/injectable.dart';

abstract interface class CryptoDetailRemoteDataSource {
  Future<CryptoDetailModel> getDetail({required String id});
}

@Injectable(as: CryptoDetailRemoteDataSource)
class CryptoDetailRemoteDataSourceImpl implements CryptoDetailRemoteDataSource {
  CryptoDetailRemoteDataSourceImpl({required NetworkClient networkClient}) : _networkClient = networkClient;

  final NetworkClient _networkClient;

  @override
  Future<CryptoDetailModel> getDetail({required String id}) async {
    try {
      final response = await _networkClient.get<List<dynamic>>(
        ApiConstants.getDetail(id: id),
      );

      if (response.data == null) {
        throw Exception();
      }

      return CryptoDetailModel.fromJson(response.data![0] as Map<String, dynamic>);
    } catch (e) {
      throw Exception(e);
    }
  }
}
