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
            Row(
              children: [
                UIKitNetworkImage(
                  height: context.highValue,
                  imageUrl: cryptocurrency.image,
                  errorWidget: const Icon(Icons.error_outline),
                ),
                SizedBox(
                  width: context.mediumValue,
                ),
                TextLarge('${cryptocurrency.symbol.toUpperCase()} Overview'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _OverviewCard(timePeriod: '24H', priceChange: cryptocurrency.priceChange24h),
                _OverviewCard(timePeriod: '7D', priceChange: cryptocurrency.priceChange7d),
                _OverviewCard(timePeriod: '1M', priceChange: cryptocurrency.priceChange30d),
                _OverviewCard(timePeriod: '1Y', priceChange: cryptocurrency.priceChange1y),
              ],
            ),
            TextLarge('${cryptocurrency.symbol.toUpperCase()} Details'),
            _DetailCard(
              child: _SectionDetails(cryptocurrency: cryptocurrency),
            ),
            TextLarge('${cryptocurrency.symbol.toUpperCase()} Historical Data'),
            _DetailCard(
              child: _SectionHistoricalData(cryptocurrency: cryptocurrency),
            ),
          ].withSpaceBetween(height: context.mediumValue),
        ),
      ),
    );
  }
}
