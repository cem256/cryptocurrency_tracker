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
          leading: LocaleKeys.crypto_details_view_rank.tr(),
          trailing: LocaleKeys.common_market_cap_rank.tr(args: [cryptocurrency.marketCapRank.toString()]),
        ),
        const Divider(),
        _DetailListTile(
          leading: LocaleKeys.crypto_details_view_price.tr(),
          trailing: NumberFormatUtils.getCurrency(value: cryptocurrency.currentPrice),
        ),
        const Divider(),
        _DetailListTile(
          leading: LocaleKeys.crypto_details_view_market_cap.tr(),
          trailing: NumberFormatUtils.getCurrency(value: cryptocurrency.marketCap, isLargeNumber: true),
        ),
        const Divider(),
        _DetailListTile(
          leading: LocaleKeys.crypto_details_view_trading_volume_24H.tr(),
          trailing: NumberFormatUtils.getCurrency(value: cryptocurrency.tradingVolume, isLargeNumber: true),
        ),
      ],
    );
  }
}
