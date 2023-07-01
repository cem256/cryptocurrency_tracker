part of '../view/crypto_detail_view.dart';

class _DetailListTile extends StatelessWidget {
  const _DetailListTile({required this.leading, required this.trailing});

  final String leading;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextNormal(leading),
      trailing: TextNormal(trailing),
    );
  }
}
