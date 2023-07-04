import 'dart:async';

import 'package:cryptocurrency_tracker/app/constants/duration_contants.dart';
import 'package:cryptocurrency_tracker/core/utils/event_transformer/event_transformer_utils.dart';
import 'package:cryptocurrency_tracker/feature/search/domain/entities/search_entity.dart';
import 'package:cryptocurrency_tracker/feature/search/domain/usecases/uc_search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'search_bloc.freezed.dart';
part 'search_event.dart';
part 'search_state.dart';

@Injectable()
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({required UCSearch ucSearch})
      : _ucSearch = ucSearch,
        super(SearchState.initial()) {
    on<_QueryChanged>(_onQueryChanged, transformer: EventTransformerUtils.debounce(DurationContants.medium()));
    on<_SearchFieldCleared>(_onSearchFieldCleared);
  }

  final UCSearch _ucSearch;

  Future<void> _onQueryChanged(_QueryChanged event, Emitter<SearchState> emit) async {
    if (event.query.isEmpty) return;
    emit(state.copyWith(status: SearchStatus.loading));
    final result = await _ucSearch.execute(query: event.query);

    result.fold((failure) => emit(state.copyWith(status: SearchStatus.failure)), (success) {
      if (success.isEmpty) {
        emit(state.copyWith(status: SearchStatus.noResult, query: event.query));
      } else {
        emit(state.copyWith(status: SearchStatus.success, cryptocurrencies: success, query: event.query));
      }
    });
  }

  void _onSearchFieldCleared(_SearchFieldCleared event, Emitter<SearchState> emit) {
    emit(SearchState.initial());
  }
}
