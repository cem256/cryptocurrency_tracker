import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_entity.freezed.dart';

@freezed
class SearchEntity with _$SearchEntity {
  const factory SearchEntity({
    required String id,
    required String symbol,
    required String name,
    required String image,
    required int marketCapRank,
  }) = _SearchEntity;

  factory SearchEntity.initial() => const SearchEntity(
        id: '',
        symbol: '',
        name: '',
        image: '',
        marketCapRank: 0,
      );
}
