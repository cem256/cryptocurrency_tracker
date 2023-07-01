import 'package:crypto_app/feature/crypto_detail/domain/entities/crypto_detail_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_detail_model.freezed.dart';
part 'crypto_detail_model.g.dart';

@freezed
class CryptoDetailModel with _$CryptoDetailModel {
  const factory CryptoDetailModel({
    String? id,
    String? symbol,
    String? name,
    String? image,
    @JsonKey(name: 'market_cap') double? marketCap,
    @JsonKey(name: 'total_volume') double? tradingVolume,
    @JsonKey(name: 'market_cap_rank') int? marketCapRank,
    @JsonKey(name: 'current_price') double? currentPrice,
    @JsonKey(name: 'price_change_percentage_1h_in_currency') double? priceChange1h,
    @JsonKey(name: 'price_change_percentage_24h_in_currency') double? priceChange24h,
    @JsonKey(name: 'price_change_percentage_7d_in_currency') double? priceChange7d,
    @JsonKey(name: 'price_change_percentage_30d_in_currency') double? priceChange30d,
    @JsonKey(name: 'price_change_percentage_1y_in_currency') double? priceChange1y,
  }) = _CryptoDetailModel;

  factory CryptoDetailModel.fromJson(Map<String, dynamic> json) => _$CryptoDetailModelFromJson(json);
}

extension CryptoDetailModelX on CryptoDetailModel {
  CryptoDetailEntity toCryptoDetailEntity() {
    return CryptoDetailEntity(
      id: id ?? CryptoDetailEntity.initial().id,
      symbol: symbol ?? CryptoDetailEntity.initial().symbol,
      name: name ?? CryptoDetailEntity.initial().name,
      image: image ?? CryptoDetailEntity.initial().image,
      marketCap: marketCap ?? CryptoDetailEntity.initial().marketCap,
      marketCapRank: marketCapRank ?? CryptoDetailEntity.initial().marketCapRank,
      tradingVolume: tradingVolume ?? CryptoDetailEntity.initial().tradingVolume,
      currentPrice: currentPrice ?? CryptoDetailEntity.initial().currentPrice,
      priceChange1h: priceChange1h ?? CryptoDetailEntity.initial().priceChange1h,
      priceChange24h: priceChange24h ?? CryptoDetailEntity.initial().priceChange24h,
      priceChange7d: priceChange7d ?? CryptoDetailEntity.initial().priceChange7d,
      priceChange30d: priceChange30d ?? CryptoDetailEntity.initial().priceChange30d,
      priceChange1y: priceChange1y ?? CryptoDetailEntity.initial().priceChange1y,
    );
  }
}
