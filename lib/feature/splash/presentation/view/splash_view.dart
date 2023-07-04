import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cryptocurrency_tracker/app/router/app_router.gr.dart';
import 'package:cryptocurrency_tracker/feature/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:cryptocurrency_tracker/feature/splash/presentation/cubit/splash_cubit.dart';
import 'package:cryptocurrency_tracker/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SplashCubit>(),
      child: const Scaffold(
        body: _SplashViewBody(),
      ),
    );
  }
}

class _SplashViewBody extends StatefulWidget {
  const _SplashViewBody();

  @override
  State<_SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<_SplashViewBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => checkIsOnboardingCompleted());
  }

  Future<void> checkIsOnboardingCompleted() async {
    await context.read<SplashCubit>().checkIsOnboardingCompleted();

    if (context.mounted) {
      // init favorites cubit
      await context.read<FavoritesCubit>().init().then((_) => context.read<FavoritesCubit>().getFavorites());
      //navigate to route depending on onboarding state
      if (context.mounted && (context.read<SplashCubit>().state.isOnboardingCompleted ?? false)) {
        await context.router.replace(const NavbarRoute());
      } else {
        await context.router.replace(const OnboardingRoute());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
