part of 'crypto_bloc.dart';

@freezed
class CryptoState with _$CryptoState {
  const factory CryptoState({
    required ViewStatus status,
    required List<CryptoEntity> cryptocurrencies,
    required bool hasReachedMax,
    Failure? failure,
  }) = _CryptoState;

  factory CryptoState.initial() => const CryptoState(
        status: ViewStatus.loading,
        cryptocurrencies: <CryptoEntity>[],
        hasReachedMax: false,
      );
}
