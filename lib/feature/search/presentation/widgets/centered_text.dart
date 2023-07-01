part of '../view/search_view.dart';

class _CenteredText extends StatelessWidget {
  const _CenteredText({required this.text});

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
