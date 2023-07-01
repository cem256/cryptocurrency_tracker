import 'package:crypto_app/app/widgets/text/text_normal.dart';
import 'package:crypto_app/core/extensions/context_extensions.dart';
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
          const TextNormal('Oops! Something went wrong.'),
          SizedBox(height: context.mediumValue),
          TextButton.icon(
            onPressed: onPressed,
            icon: const Icon(Icons.refresh_outlined),
            label: const TextNormal('Retry'),
          ),
        ],
      ),
    );
  }
}
