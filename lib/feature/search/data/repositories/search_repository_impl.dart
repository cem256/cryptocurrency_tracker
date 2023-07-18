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
  Future<Either<Failure, List<SearchEntity>>> search({required String query}) async {
    try {
      final result = await _remoteDataSource.search(query: query);
      return right(result.map((e) => e.toSearchEntity()).toList());
    } on DioException {
      return left(const Failure.networkFailure());
    } on NullResponseException {
      return left(const Failure.nullResponseFaiure());
    } catch (e) {
      debugPrint('ERROR: Method search MESSAGE: $e');
      return left(const Failure.unknownFailure());
    }
  }
}
