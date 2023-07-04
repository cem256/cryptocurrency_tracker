import 'package:cryptocurrency_tracker/feature/splash/domain/usecases/check_is_onboarding_completed_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:injectable/injectable.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  SplashCubit({required UCCheckIsOnboardingCompleted uc})
      : _uc = uc,
        super(const SplashState());

  final UCCheckIsOnboardingCompleted _uc;

  Future<void> checkIsOnboardingCompleted() async {
    final result = await _uc.execute();

    result
        ? emit(state.copyWith(isOnboardingCompleted: true))
        : emit(
            state.copyWith(isOnboardingCompleted: false),
          );
  }
}
