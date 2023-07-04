// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cryptocurrency_tracker/app/constants/cache_constants.dart';
import 'package:cryptocurrency_tracker/feature/favorites/domain/models/favorite_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';

part 'favorite_model.g.dart';
part 'favorite_model.freezed.dart';

@freezed
class FavoriteModel extends HiveObject with _$FavoriteModel {
  @HiveType(typeId: CacheConstants.favoritesTypeID)
  factory FavoriteModel({
    @HiveField(0) String? id,
    @HiveField(1) String? name,
    @HiveField(2) String? symbol,
    @HiveField(3) String? image,
    @HiveField(4) int? marketCapRank,
  }) = _FavoriteModel;

  FavoriteModel._();
}

extension FavoriteModelX on FavoriteModel {
  FavoriteEntity toFavoriteEntity() {
    return FavoriteEntity(
      id: id ?? FavoriteEntity.initial().id,
      name: name ?? FavoriteEntity.initial().name,
      image: image ?? FavoriteEntity.initial().image,
      symbol: symbol ?? FavoriteEntity.initial().symbol,
      marketCapRank: marketCapRank ?? FavoriteEntity.initial().marketCapRank,
    );
  }
}
