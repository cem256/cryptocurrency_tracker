part of '../view/crypto_detail_view.dart';

class _CryptoDetailSuccessWidget extends StatelessWidget {
  const _CryptoDetailSuccessWidget({required this.cryptocurrency});

  final CryptoDetailEntity cryptocurrency;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: context.paddingAllDefault,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                UIKitNetworkImage(
                  height: context.highValue,
                  imageUrl: cryptocurrency.image,
                  errorWidget: const Icon(Icons.error),
                ),
                SizedBox(
                  width: context.defaultValue,
                ),
                TextLarge(
                  LocaleKeys.crypto_details_view_overview.tr(args: [cryptocurrency.symbol.toUpperCase()]),
                ),
                const Spacer(),
                FavoritesButton(
                  id: cryptocurrency.id,
                  name: cryptocurrency.name,
                  symbol: cryptocurrency.symbol,
                  image: cryptocurrency.image,
                  marketCapRank: cryptocurrency.marketCapRank,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _OverviewCard(
                  timePeriod: LocaleKeys.crypto_details_view_24H.tr(),
                  priceChange: cryptocurrency.priceChange24h,
                ),
                _OverviewCard(
                  timePeriod: LocaleKeys.crypto_details_view_7D.tr(),
                  priceChange: cryptocurrency.priceChange7d,
                ),
                _OverviewCard(
                  timePeriod: LocaleKeys.crypto_details_view_1M.tr(),
                  priceChange: cryptocurrency.priceChange30d,
                ),
                _OverviewCard(
                  timePeriod: LocaleKeys.crypto_details_view_1Y.tr(),
                  priceChange: cryptocurrency.priceChange1y,
                ),
              ],
            ),
            TextLarge(LocaleKeys.crypto_details_view_details.tr(args: [cryptocurrency.symbol.toUpperCase()])),
            _DetailCard(
              child: _SectionDetails(cryptocurrency: cryptocurrency),
            ),
            TextLarge(LocaleKeys.crypto_details_view_historical_data.tr(args: [cryptocurrency.symbol.toUpperCase()])),
            _DetailCard(
              child: _SectionHistoricalData(cryptocurrency: cryptocurrency),
            ),
          ].withSpaceBetween(height: context.defaultValue),
        ),
      ),
    );
  }
}
