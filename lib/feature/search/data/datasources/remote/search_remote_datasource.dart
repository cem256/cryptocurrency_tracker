import 'package:crypto_app/app/constants/api_constants.dart';
import 'package:crypto_app/core/clients/network/network_client.dart';
import 'package:crypto_app/feature/search/data/models/search_model.dart';
import 'package:injectable/injectable.dart';

abstract class SearchRemoteDataSource {
  Future<List<SearchModel>> search({required String query});
}

@Injectable(as: SearchRemoteDataSource)
class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  SearchRemoteDataSourceImpl({required NetworkClient networkClient}) : _networkClient = networkClient;

  final NetworkClient _networkClient;

  @override
  Future<List<SearchModel>> search({required String query}) async {
    try {
      final response = await _networkClient.get<Map<String, dynamic>>(
        ApiConstants.search,
        queryParameters: {'query': query},
      );

      if (response.data == null) {
        throw Exception();
      }
      final coins = response.data!['coins'] as List;
      if (coins.isEmpty) {
        return <SearchModel>[];
      }
      return coins.map((e) => SearchModel.fromJson(e as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
