import 'package:cryptocurrency_tracker/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class TextNormal extends StatelessWidget {
  const TextNormal(this.text, {super.key, this.style, this.overflow, this.maxLines, this.textAlign});

  final String text;
  final TextStyle? style;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? context.textTheme.bodyLarge,
      overflow: overflow ?? TextOverflow.ellipsis,
      maxLines: maxLines ?? 1,
      textAlign: textAlign,
    );
  }
}
