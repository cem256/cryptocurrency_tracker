import 'package:cryptocurrency_tracker/app/l10n/app_l10n.g.dart';
import 'package:cryptocurrency_tracker/app/widgets/text/text_normal.dart';
import 'package:cryptocurrency_tracker/core/extensions/context_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget({required this.onPressed, super.key});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextNormal(LocaleKeys.errors_somethingWentWrong.tr()),
          SizedBox(height: context.mediumValue),
          TextButton.icon(
            onPressed: onPressed,
            icon: const Icon(Icons.refresh),
            label: TextNormal(LocaleKeys.errors_retry.tr()),
          ),
        ],
      ),
    );
  }
}
