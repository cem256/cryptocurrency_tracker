import 'dart:async';

import 'package:crypto_app/core/enums/page_status.dart';
import 'package:crypto_app/feature/crypto_detail/domain/entities/crypto_detail_entity.dart';
import 'package:crypto_app/feature/crypto_detail/domain/usecases/uc_get_crypto_detail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'crypto_detail_bloc.freezed.dart';
part 'crypto_detail_event.dart';
part 'crypto_detail_state.dart';

@Injectable()
class CryptoDetailBloc extends Bloc<CryptoDetailEvent, CryptoDetailState> {
  CryptoDetailBloc({required UCGetCryptoDetail uc})
      : _uc = uc,
        super(CryptoDetailState.initial()) {
    on<_DetailFetched>(_onCryptoDetailFetched);
  }

  final UCGetCryptoDetail _uc;

  Future<void> _onCryptoDetailFetched(_DetailFetched event, Emitter<CryptoDetailState> emit) async {
    emit(state.copyWith(status: PageStatus.initial));
    final result = await _uc.execute(id: event.id);

    result.fold(
      (failure) => emit(
        state.copyWith(status: PageStatus.failure),
      ),
      (success) => emit(
        state.copyWith(status: PageStatus.success, cryptocurrency: success),
      ),
    );
  }
}
