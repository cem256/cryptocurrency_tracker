import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_entity.freezed.dart';

@freezed
class CryptoEntity with _$CryptoEntity {
  const factory CryptoEntity({
    required String id,
    required String symbol,
    required String name,
    required String image,
    required int marketCapRank,
    required double currentPrice,
    required double priceChange1h,
    required double priceChange24h,
    required double priceChange7d,
  }) = _CryptoEntity;

  factory CryptoEntity.initial() => const CryptoEntity(
        id: '',
        symbol: '',
        name: '',
        image: '',
        marketCapRank: 0,
        currentPrice: 0,
        priceChange1h: 0,
        priceChange24h: 0,
        priceChange7d: 0,
      );
}
