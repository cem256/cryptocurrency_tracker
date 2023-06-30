part of 'crypto_detail_bloc.dart';

@freezed
class CryptoDetailEvent with _$CryptoDetailEvent {
  const factory CryptoDetailEvent.onCryptoDetailFetched({required String id}) = _DetailFetched;
}
