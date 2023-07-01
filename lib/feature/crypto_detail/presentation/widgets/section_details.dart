part of '../view/crypto_detail_view.dart';

class _SectionDetails extends StatelessWidget {
  const _SectionDetails({required this.cryptocurrency});

  final CryptoDetailEntity cryptocurrency;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _DetailListTile(
          leading: 'Rank',
          trailing: '#${cryptocurrency.marketCapRank}',
        ),
        const Divider(),
        _DetailListTile(
          leading: 'Price',
          trailing: NumberFormatUtils.getCurrency(value: cryptocurrency.currentPrice),
        ),
        const Divider(),
        _DetailListTile(
          leading: 'Market Cap',
          trailing: NumberFormatUtils.getCurrency(value: cryptocurrency.marketCap, isLargeNumber: true),
        ),
        const Divider(),
        _DetailListTile(
          leading: 'Trading Volume 24H',
          trailing: NumberFormatUtils.getCurrency(value: cryptocurrency.tradingVolume, isLargeNumber: true),
        ),
      ],
    );
  }
}
