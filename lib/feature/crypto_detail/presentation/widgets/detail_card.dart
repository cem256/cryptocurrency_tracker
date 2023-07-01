part of '../view/crypto_detail_view.dart';

class _DetailCard extends StatelessWidget {
  const _DetailCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: context.paddingAllDefault,
        child: child,
      ),
    );
  }
}
