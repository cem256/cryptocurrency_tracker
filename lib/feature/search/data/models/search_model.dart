import 'package:cryptocurrency_tracker/feature/search/domain/entities/search_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_model.freezed.dart';
part 'search_model.g.dart';

@freezed
class SearchModel with _$SearchModel {
  const factory SearchModel({
    String? id,
    String? symbol,
    String? name,
    @JsonKey(name: 'large') String? image,
    @JsonKey(name: 'market_cap_rank') int? marketCapRank,
  }) = _SearchModel;

  factory SearchModel.fromJson(Map<String, dynamic> json) => _$SearchModelFromJson(json);
}

extension SearchModelX on SearchModel {
  SearchEntity toSearchEntity() {
    return SearchEntity(
      id: id ?? SearchEntity.initial().id,
      symbol: symbol ?? SearchEntity.initial().symbol,
      name: name ?? SearchEntity.initial().name,
      image: image ?? SearchEntity.initial().image,
      marketCapRank: marketCapRank ?? SearchEntity.initial().marketCapRank,
    );
  }
}
