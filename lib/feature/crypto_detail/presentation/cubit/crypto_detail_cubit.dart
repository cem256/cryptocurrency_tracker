import 'package:crypto_app/core/enums/page_status.dart';
import 'package:crypto_app/feature/crypto_detail/domain/entities/crypto_detail_entity.dart';
import 'package:crypto_app/feature/crypto_detail/domain/usecases/uc_get_crypto_detail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'crypto_detail_cubit.freezed.dart';
part 'crypto_detail_state.dart';

@Injectable()
class CryptoDetailCubit extends Cubit<CryptoDetailState> {
  CryptoDetailCubit({required UCGetCryptoDetail uc})
      : _uc = uc,
        super(CryptoDetailState.initial());

  final UCGetCryptoDetail _uc;

  Future<void> fetchCryptoDetail({required String id}) async {
    emit(state.copyWith(status: PageStatus.loading));
    final result = await _uc.execute(id: id);

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
