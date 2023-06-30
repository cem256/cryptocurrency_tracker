import 'dart:developer';

import 'package:crypto_app/core/models/failure/failure_model.dart';
import 'package:crypto_app/feature/search/data/datasources/remote/search_remote_datasource.dart';
import 'package:crypto_app/feature/search/data/models/search_model.dart';
import 'package:crypto_app/feature/search/domain/entities/search_entity.dart';
import 'package:crypto_app/feature/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SearchRepository)
class SearchRepositoryImpl implements SearchRepository {
  SearchRepositoryImpl({required SearchRemoteDataSource remoteDataSource}) : _remoteDataSource = remoteDataSource;

  final SearchRemoteDataSource _remoteDataSource;

  @override
  Future<Either<FailureModel, List<SearchEntity>>> search({required String query}) async {
    try {
      final result = await _remoteDataSource.search(query: query);
      return right(result.map((e) => e.toSearchEntity()).toList());
    } on Exception catch (e) {
      log('ERROR: SearchRepositoryImpl: $e');
      return left(const FailureModel());
    }
  }
}
