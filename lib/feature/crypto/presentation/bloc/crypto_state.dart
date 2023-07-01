part of 'crypto_bloc.dart';

@freezed
class CryptoState with _$CryptoState {
  const factory CryptoState({
    required PageStatus status,
    required List<CryptoEntity> cryptocurrencies,
    required bool hasReachedMax,
  }) = _CryptoState;

  factory CryptoState.initial() => const CryptoState(
        status: PageStatus.loading,
        cryptocurrencies: <CryptoEntity>[],
        hasReachedMax: false,
      );
}
