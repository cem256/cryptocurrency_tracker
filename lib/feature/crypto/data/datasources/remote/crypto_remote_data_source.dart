import 'package:cryptocurrency_tracker/app/constants/api_constants.dart';
import 'package:cryptocurrency_tracker/app/errors/exceptions/exceptions.dart';
import 'package:cryptocurrency_tracker/core/clients/network/network_client.dart';
import 'package:cryptocurrency_tracker/feature/crypto/data/models/crypto_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract interface class CryptoRemoteDataSource {
  Future<List<CryptoModel>> getAllCryptocurrencies({required int page, required int perPage});
}

@Injectable(as: CryptoRemoteDataSource)
final class CryptoRemoteDataSourceImpl implements CryptoRemoteDataSource {
  CryptoRemoteDataSourceImpl({required NetworkClient networkClient}) : _networkClient = networkClient;

  final NetworkClient _networkClient;

  @override
  Future<List<CryptoModel>> getAllCryptocurrencies({required int page, required int perPage}) async {
    try {
      final response = await _networkClient.get<List<dynamic>>(
        ApiConstants.getAll,
        queryParameters: {
          'per_page': perPage,
          'page': page,
          'vs_currency': 'usd',
          'order': 'market_cap_desc',
          'sparkline': false,
          'price_change_percentage': '1h,24h,7d',
          'locale': 'en'
        },
      );

      if (response.data == null) {
        throw NullResponseException();
      }

      return response.data!.map((e) => CryptoModel.fromJson(e as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw DioException(requestOptions: e.requestOptions, message: e.message);
    } catch (_) {
      throw UnknownException();
    }
  }
}
