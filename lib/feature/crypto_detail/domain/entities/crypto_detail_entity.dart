import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_detail_entity.freezed.dart';

@freezed
class CryptoDetailEntity with _$CryptoDetailEntity {
  const factory CryptoDetailEntity({
    required String id,
    required String symbol,
    required String name,
    required String image,
    required int marketCapRank,
    required double ath,
    required double athChangePercentage,
    required double atl,
    required double atlChangePercentage,
    required double currentPrice,
    required double priceChange1h,
    required double priceChange24h,
    required double priceChange7d,
    required double priceChange30d,
    required double priceChange1y,
  }) = _CryptoDetailEntity;

  factory CryptoDetailEntity.initial() => const CryptoDetailEntity(
        id: '',
        symbol: '',
        name: '',
        image: '',
        marketCapRank: 0,
        ath: 0,
        athChangePercentage: 0,
        atl: 0,
        atlChangePercentage: 0,
        currentPrice: 0,
        priceChange1h: 0,
        priceChange24h: 0,
        priceChange7d: 0,
        priceChange30d: 0,
        priceChange1y: 0,
      );
}
