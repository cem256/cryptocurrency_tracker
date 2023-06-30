part of '../view/search_view.dart';

class _CenteredText extends StatelessWidget {
  const _CenteredText({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAllLow,
      child: Center(
        child: Text(
          text,
          style: context.textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
