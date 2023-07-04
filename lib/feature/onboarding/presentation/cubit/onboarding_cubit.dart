import 'package:cryptocurrency_tracker/feature/onboarding/domain/usecases/complete_onboarding_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'onboarding_cubit.freezed.dart';
part 'onboarding_state.dart';

@injectable
class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit({required UCCompleteOnboarding uc})
      : _uc = uc,
        super(const OnboardingState());

  final UCCompleteOnboarding _uc;

  Future<void> completeOnboarding() async {
    await _uc.execute();
  }

  void changePageIndex(int index) {
    emit(state.copyWith(pageIndex: index));
  }
}
