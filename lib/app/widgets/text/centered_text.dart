import 'package:cryptocurrency_tracker/app/widgets/text/text_normal.dart';
import 'package:cryptocurrency_tracker/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class CenteredText extends StatelessWidget {
  const CenteredText({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAllDefault,
      child: Center(
        child: TextNormal(
          text,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
