import 'package:crypto_app/feature/favorites/data/models/favorite_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_entity.freezed.dart';

@freezed
class FavoriteEntity with _$FavoriteEntity {
  const factory FavoriteEntity({
    required String id,
    required String symbol,
    required String name,
    required String image,
    required int marketCapRank,
  }) = _FavoriteEntity;

  factory FavoriteEntity.initial() => const FavoriteEntity(
        id: '',
        symbol: '',
        name: '',
        image: '',
        marketCapRank: 0,
      );
}

extension FavoriteEntityX on FavoriteEntity {
  FavoriteModel toFavoriteModel() {
    return FavoriteModel(
      id: id,
      symbol: symbol,
      name: name,
      image: image,
      marketCapRank: marketCapRank,
    );
  }
}
