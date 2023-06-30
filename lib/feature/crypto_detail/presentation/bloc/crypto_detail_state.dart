part of 'crypto_detail_bloc.dart';

@freezed
class CryptoDetailState with _$CryptoDetailState {
  const factory CryptoDetailState({
    required PageStatus status,
    required CryptoDetailEntity cryptocurrency,
  }) = _CryptoDetailState;

  factory CryptoDetailState.initial() => CryptoDetailState(
        status: PageStatus.initial,
        cryptocurrency: CryptoDetailEntity.initial(),
      );
}
