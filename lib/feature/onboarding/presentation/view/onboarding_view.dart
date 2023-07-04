import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cryptocurrency_tracker/app/router/app_router.gr.dart';
import 'package:cryptocurrency_tracker/app/widgets/text/text_large.dart';
import 'package:cryptocurrency_tracker/app/widgets/text/text_normal.dart';
import 'package:cryptocurrency_tracker/core/extensions/context_extensions.dart';
import 'package:cryptocurrency_tracker/core/extensions/widget_extensions.dart';
import 'package:cryptocurrency_tracker/feature/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:cryptocurrency_tracker/feature/onboarding/presentation/model/onboarding_model.dart';
import 'package:cryptocurrency_tracker/feature/onboarding/presentation/widgets/dots_indicator.dart';
import 'package:cryptocurrency_tracker/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<OnboardingCubit>(),
        child: const _OnboardingViewBody(),
      ),
    );
  }
}

class _OnboardingViewBody extends StatelessWidget {
  const _OnboardingViewBody();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: context.paddingAllDefault,
        child: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            return Column(
              children: [
                const Spacer(),
                Expanded(
                  flex: 4,
                  child: PageView.builder(
                    itemCount: OnboardingModel.items.length,
                    itemBuilder: (context, index) => _OnboardingPage(
                      item: OnboardingModel.items[index],
                    ),
                    onPageChanged: (index) => context.read<OnboardingCubit>().changePageIndex(index),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => SizedBox(width: context.lowValue),
                    scrollDirection: Axis.horizontal,
                    itemCount: OnboardingModel.items.length,
                    itemBuilder: (context, index) => DotsIndicator(
                      isSelected: state.pageIndex == index,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await context.read<OnboardingCubit>().completeOnboarding();
                    if (context.mounted) {
                      unawaited(context.router.replace(const NavbarRoute()));
                    }
                  },
                  child: const Text('Get Started'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  const _OnboardingPage({required this.item});

  final OnboardingModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SvgPicture.asset(
            item.imagePath,
          ),
        ),
        TextLarge(
          item.title,
          textAlign: TextAlign.center,
        ),
        TextNormal(
          item.description,
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
      ].withSpaceBetween(height: context.mediumValue),
    );
  }
}
