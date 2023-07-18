import 'package:cryptocurrency_tracker/app/constants/api_constants.dart';
import 'package:cryptocurrency_tracker/app/errors/exceptions/exceptions.dart';
import 'package:cryptocurrency_tracker/core/clients/network/network_client.dart';

import 'package:cryptocurrency_tracker/feature/crypto_detail/data/models/crypto_detail_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// [CryptoDetailRemoteDataSource] is a contract class which defines the methods
/// that any implementation of [CryptoDetailRemoteDataSource] must implement.
abstract interface class CryptoDetailRemoteDataSource {
  Future<CryptoDetailModel> getDetail({required String id});
}

@Injectable(as: CryptoDetailRemoteDataSource)
final class CryptoDetailRemoteDataSourceImpl implements CryptoDetailRemoteDataSource {
  CryptoDetailRemoteDataSourceImpl({required NetworkClient networkClient}) : _networkClient = networkClient;

  final NetworkClient _networkClient;

  @override
  // Returns a [CryptoDetailModel] from the remote API.
  Future<CryptoDetailModel> getDetail({required String id}) async {
    try {
      // Get popular mangas from API using [NetworkClient]
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
      // If response is null throw [NullResponseException]
      if (response.data == null) {
        throw NullResponseException();
      }
      // Convert data as  [CryptoDetailModel]
      return CryptoDetailModel.fromJson(response.data![0] as Map<String, dynamic>);
      // Catch [DioException] and throw [DioException]
    } on DioException catch (e) {
      throw DioException(requestOptions: e.requestOptions, message: e.message);
      // Throw [UnknownException] for any other exception
    } catch (_) {
      throw UnknownException();
    }
  }
}
