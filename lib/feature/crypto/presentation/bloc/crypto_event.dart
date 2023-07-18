part of 'crypto_bloc.dart';

@freezed
class CryptoEvent with _$CryptoEvent {
  /// Event to fetch the cryptocurrencies.
  const factory CryptoEvent.onCryptocurrenciesFetched() = _Fetched;
}
