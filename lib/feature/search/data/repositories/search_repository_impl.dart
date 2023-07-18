import 'package:cryptocurrency_tracker/app/errors/exceptions/exceptions.dart';
import 'package:cryptocurrency_tracker/app/errors/failures/failure.dart';
import 'package:cryptocurrency_tracker/feature/search/data/datasources/remote/search_remote_datasource.dart';
import 'package:cryptocurrency_tracker/feature/search/data/models/search_model.dart';
import 'package:cryptocurrency_tracker/feature/search/domain/entities/search_entity.dart';
import 'package:cryptocurrency_tracker/feature/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SearchRepository)
final class SearchRepositoryImpl implements SearchRepository {
  SearchRepositoryImpl({required SearchRemoteDataSource remoteDataSource}) : _remoteDataSource = remoteDataSource;

  final SearchRemoteDataSource _remoteDataSource;

  @override
  // Gets list of cryptocurrencies matches the given query
  // from the remote data source and returns a list of [SearchEntity] or a [Failure].
  Future<Either<Failure, List<SearchEntity>>> search({required String query}) async {
    try {
      // Get list of [MangaModel] from the remote data source.
      final result = await _remoteDataSource.search(query: query);
      // Map the list of [SearchModel] to a list of [SearchEntity].
      return right(result.map((e) => e.toSearchEntity()).toList());
      // On DioException, return a [Failure.networkFailure].
    } on DioException {
      return left(const Failure.networkFailure());
      // On NullResponseException, return a [Failure.nullResponseFaiure].
    } on NullResponseException {
      return left(const Failure.nullResponseFaiure());
      // On any other exception, return a [UnknownFailure] and print the error.
    } catch (e) {
      debugPrint('ERROR: Method search MESSAGE: $e');
      return left(const Failure.unknownFailure());
    }
  }
}
