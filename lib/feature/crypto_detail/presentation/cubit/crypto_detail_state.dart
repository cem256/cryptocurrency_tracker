part of 'crypto_detail_cubit.dart';

@freezed
class CryptoDetailState with _$CryptoDetailState {
  const factory CryptoDetailState({
    required ViewStatus status,
    required CryptoDetailEntity cryptocurrency,
  }) = _CryptoDetailState;

  factory CryptoDetailState.initial() => CryptoDetailState(
        status: ViewStatus.loading,
        cryptocurrency: CryptoDetailEntity.initial(),
      );
}
