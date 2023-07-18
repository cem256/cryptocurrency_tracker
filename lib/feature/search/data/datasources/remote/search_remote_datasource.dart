import 'package:cryptocurrency_tracker/app/constants/api_constants.dart';
import 'package:cryptocurrency_tracker/app/errors/exceptions/exceptions.dart';
import 'package:cryptocurrency_tracker/core/clients/network/network_client.dart';
import 'package:cryptocurrency_tracker/feature/search/data/models/search_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// [SearchRemoteDataSource] is a contract class which defines the methods
/// that any implementation of [SearchRemoteDataSource] must implement.
abstract interface class SearchRemoteDataSource {
  Future<List<SearchModel>> search({required String query});
}

@Injectable(as: SearchRemoteDataSource)
final class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  SearchRemoteDataSourceImpl({required NetworkClient networkClient}) : _networkClient = networkClient;

  final NetworkClient _networkClient;

  @override
  // Returns a list of [SearchModel] from the remote API.
  Future<List<SearchModel>> search({required String query}) async {
    try {
      // Get cryptocurrencies that match the given query from API using [NetworkClient]
      final response = await _networkClient.get<Map<String, dynamic>>(
        ApiConstants.search,
        queryParameters: {'query': query},
      );
      // If response  data is null throw [NullResponseException]
      if (response.data == null) {
        throw NullResponseException();
      }
      final coins = response.data!['coins'] as List;
      if (coins.isEmpty) {
        return <SearchModel>[];
      }
      // Map the response to a list of [SearchModel]
      return coins.map((e) => SearchModel.fromJson(e as Map<String, dynamic>)).toList();
      // Catch [DioException] and throw [DioException]
    } on DioException catch (e) {
      throw DioException(requestOptions: e.requestOptions, message: e.message);
      // Throw [UnknownException] for any other exception
    } catch (_) {
      throw UnknownException();
    }
  }
}
