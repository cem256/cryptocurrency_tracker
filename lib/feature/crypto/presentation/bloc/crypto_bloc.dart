import 'dart:async';

import 'package:cryptocurrency_tracker/app/constants/duration_contants.dart';
import 'package:cryptocurrency_tracker/app/errors/failures/failure.dart';
import 'package:cryptocurrency_tracker/core/enums/view_status.dart';
import 'package:cryptocurrency_tracker/core/utils/event_transformer/event_transformer_utils.dart';
import 'package:cryptocurrency_tracker/feature/crypto/domain/entities/crypto_entity.dart';
import 'package:cryptocurrency_tracker/feature/crypto/domain/usecases/uc_get_all_cryptocurrencies.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'crypto_bloc.freezed.dart';
part 'crypto_event.dart';
part 'crypto_state.dart';

@Injectable()
class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  CryptoBloc({required UCGetAllCryptocurrencies ucGetAllCryptocurrencies})
      : _ucGetAllCryptocurrencies = ucGetAllCryptocurrencies,
        super(CryptoState.initial()) {
    on<_Fetched>(_onCoinsFetched, transformer: EventTransformerUtils.throttle(DurationConstants.long()));
  }
  int _page = 1;
  final int _perPage = 50;

  final UCGetAllCryptocurrencies _ucGetAllCryptocurrencies;

  Future<void> _onCoinsFetched(_Fetched event, Emitter<CryptoState> emit) async {
    if (state.hasReachedMax) return;
    if (state.status == ViewStatus.loading) {
      final result = await _ucGetAllCryptocurrencies.execute(page: _page, perPage: _perPage);
      return result.fold((failure) => emit(state.copyWith(status: ViewStatus.failure, failure: failure)), (success) {
        _page++;
        emit(
          success.isEmpty
              ? state.copyWith(hasReachedMax: true)
              : state.copyWith(
                  status: ViewStatus.success,
                  cryptocurrencies: List.of(state.cryptocurrencies)..addAll(success),
                  hasReachedMax: false,
                ),
        );
      });
    }

    final result = await _ucGetAllCryptocurrencies.execute(page: _page, perPage: _perPage);
    result.fold((failure) => emit(state.copyWith(status: ViewStatus.failure, failure: failure)), (success) {
      _page++;
      emit(
        success.isEmpty
            ? state.copyWith(hasReachedMax: true)
            : state.copyWith(
                status: ViewStatus.success,
                cryptocurrencies: List.of(state.cryptocurrencies)..addAll(success),
                hasReachedMax: false,
              ),
      );
    });
  }
}
