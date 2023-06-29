part of 'crypto_bloc.dart';

@freezed
class CryptoEvent with _$CryptoEvent {
  const factory CryptoEvent.onCryptocurrenciesFetched() = _Fetched;
}
