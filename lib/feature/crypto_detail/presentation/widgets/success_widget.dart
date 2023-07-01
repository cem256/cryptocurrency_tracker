part of '../view/crypto_detail_view.dart';

class _SuccessWidget extends StatelessWidget {
  const _SuccessWidget({required this.cryptocurrency});

  final CryptoDetailEntity cryptocurrency;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: context.paddingAllLow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: UIKitNetworkImage(
                height: context.highValue,
                imageUrl: cryptocurrency.image,
                errorWidget: const Icon(Icons.error_outline),
              ),
            ),
            const _ChartTabBar(),
            TextLarge('${cryptocurrency.symbol.toUpperCase()} Price Changes'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _PriceChangeCard(timePeriod: '24h', priceChange: cryptocurrency.priceChange24h),
                _PriceChangeCard(timePeriod: '7d', priceChange: cryptocurrency.priceChange7d),
                _PriceChangeCard(timePeriod: '1m', priceChange: cryptocurrency.priceChange30d),
                _PriceChangeCard(timePeriod: '1y', priceChange: cryptocurrency.priceChange1y),
              ],
            ),
            TextLarge('${cryptocurrency.symbol.toUpperCase()} Price Statistics'),
            _PriceStatisticsCard(cryptocurrency: cryptocurrency),
          ].withSpaceBetween(height: context.mediumValue),
        ),
      ),
    );
  }
}
