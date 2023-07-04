import 'package:cryptocurrency_tracker/feature/crypto/domain/entities/crypto_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_model.freezed.dart';
part 'crypto_model.g.dart';

@freezed
class CryptoModel with _$CryptoModel {
  const factory CryptoModel({
    String? id,
    String? symbol,
    String? name,
    String? image,
    @JsonKey(name: 'market_cap_rank') int? marketCapRank,
    @JsonKey(name: 'current_price') double? currentPrice,
    @JsonKey(name: 'price_change_percentage_1h_in_currency') double? priceChange1h,
    @JsonKey(name: 'price_change_percentage_24h_in_currency') double? priceChange24h,
    @JsonKey(name: 'price_change_percentage_7d_in_currency') double? priceChange7d,
  }) = _CryptoModel;

  factory CryptoModel.fromJson(Map<String, dynamic> json) => _$CryptoModelFromJson(json);
}

extension CryptoModelX on CryptoModel {
  CryptoEntity toCryptoEntity() {
    return CryptoEntity(
      id: id ?? CryptoEntity.initial().id,
      symbol: symbol ?? CryptoEntity.initial().symbol,
      name: name ?? CryptoEntity.initial().name,
      image: image ?? CryptoEntity.initial().image,
      marketCapRank: marketCapRank ?? CryptoEntity.initial().marketCapRank,
      currentPrice: currentPrice ?? CryptoEntity.initial().currentPrice,
      priceChange1h: priceChange1h ?? CryptoEntity.initial().priceChange1h,
      priceChange24h: priceChange24h ?? CryptoEntity.initial().priceChange24h,
      priceChange7d: priceChange7d ?? CryptoEntity.initial().priceChange7d,
    );
  }
}
