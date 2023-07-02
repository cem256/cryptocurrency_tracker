import 'package:flutter/material.dart';

class UIKitAdaptiveIndicator extends StatelessWidget {
  const UIKitAdaptiveIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
