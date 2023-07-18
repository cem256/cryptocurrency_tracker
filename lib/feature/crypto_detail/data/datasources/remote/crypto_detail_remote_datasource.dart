import 'package:cryptocurrency_tracker/app/constants/api_constants.dart';
import 'package:cryptocurrency_tracker/core/clients/network/network_client.dart';

import 'package:cryptocurrency_tracker/feature/crypto_detail/data/models/crypto_detail_model.dart';
import 'package:injectable/injectable.dart';

abstract interface class CryptoDetailRemoteDataSource {
  Future<CryptoDetailModel> getDetail({required String id});
}

@Injectable(as: CryptoDetailRemoteDataSource)
final class CryptoDetailRemoteDataSourceImpl implements CryptoDetailRemoteDataSource {
  CryptoDetailRemoteDataSourceImpl({required NetworkClient networkClient}) : _networkClient = networkClient;

  final NetworkClient _networkClient;

  @override
  Future<CryptoDetailModel> getDetail({required String id}) async {
    try {
      final response = await _networkClient.get<List<dynamic>>(
        ApiConstants.getDetails,
        queryParameters: {
          'ids': id,
          'vs_currency': 'usd',
          'order': 'market_cap_desc',
          'per_page': 1,
          'page': 1,
          'sparkline': false,
          'price_change_percentage': '1h,24,7d,30d,1y',
          'locale': 'en'
        },
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
