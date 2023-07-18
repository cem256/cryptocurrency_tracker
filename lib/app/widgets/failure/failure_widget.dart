import 'package:cryptocurrency_tracker/app/errors/failures/failure.dart';
import 'package:cryptocurrency_tracker/app/l10n/app_l10n.g.dart';
import 'package:cryptocurrency_tracker/app/widgets/text/text_normal.dart';
import 'package:cryptocurrency_tracker/core/extensions/context_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// Takes [Failure] as a parameter and displays the error message accodingly
///
/// Takes an optional onPressed function for the retry action
class FailureWidget extends StatelessWidget {
  const FailureWidget({required this.onPressed, super.key, this.failure});

  final void Function() onPressed;
  final Failure? failure;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextNormal(
            failure?.when(
                  networkFailure: () => LocaleKeys.failure_network.tr(),
                  nullResponseFaiure: () => LocaleKeys.failure_nullResponse.tr(),
                  unknownFailure: () => LocaleKeys.failure_unknown.tr(),
                ) ??
                LocaleKeys.failure_unknown.tr(),
          ),
          SizedBox(height: context.defaultValue),
          TextButton.icon(
            onPressed: onPressed,
            icon: const Icon(Icons.refresh),
            label: TextNormal(LocaleKeys.common_retry.tr()),
          ),
        ],
      ),
    );
  }
}
