import 'package:cryptocurrency_tracker/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({
    required this.isSelected,
    super.key,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.lowValue,
      decoration: BoxDecoration(
        color: isSelected ? context.theme.colorScheme.primary : context.theme.disabledColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
