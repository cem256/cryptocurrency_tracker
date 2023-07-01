part of 'crypto_detail_cubit.dart';

@freezed
class CryptoDetailState with _$CryptoDetailState {
  const factory CryptoDetailState({
    required PageStatus status,
    required CryptoDetailEntity cryptocurrency,
  }) = _CryptoDetailState;

  factory CryptoDetailState.initial() => CryptoDetailState(
        status: PageStatus.loading,
        cryptocurrency: CryptoDetailEntity.initial(),
      );
}
