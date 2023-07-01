part of '../view/crypto_detail_view.dart';

class _PriceStatisticsCard extends StatelessWidget {
  const _PriceStatisticsCard({
    required this.cryptocurrency,
  });

  final CryptoDetailEntity cryptocurrency;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: context.paddingAllDefault,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _StatisticsListTile(
              leading: 'Rank',
              trailing: NumberFormatUtils.getRank(rank: cryptocurrency.marketCapRank),
            ),
            const Divider(),
            _StatisticsListTile(
              leading: 'Price',
              trailing: NumberFormatUtils.getCurrency(value: cryptocurrency.currentPrice),
            ),
            const Divider(),
            _StatisticsListTile(
              leading: 'Market Cap',
              trailing: NumberFormatUtils.getCurrency(value: cryptocurrency.marketCap, isLargeNumber: true),
            ),
            const Divider(),
            _StatisticsListTile(
              leading: 'Trading Volume 24(h)',
              trailing: NumberFormatUtils.getCurrency(value: cryptocurrency.tradingVolume, isLargeNumber: true),
            ),
          ],
        ),
      ),
    );
  }
}
