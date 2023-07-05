part of '../view/crypto_detail_view.dart';

class _SectionHistoricalData extends StatelessWidget {
  const _SectionHistoricalData({required this.cryptocurrency});

  final CryptoDetailEntity cryptocurrency;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _DetailListTile(
          leading: LocaleKeys.crypto_details_view_ath.tr(),
          trailing: NumberFormatUtils.getCurrency(value: cryptocurrency.ath),
        ),
        const Divider(),
        _DetailListTile(
          leading: LocaleKeys.crypto_details_view_ath_change.tr(),
          trailing: LocaleKeys.common_percentChange.tr(args: [cryptocurrency.athChange.toString()]),
        ),
        const Divider(),
        _DetailListTile(
          leading: LocaleKeys.crypto_details_view_ath_date.tr(),
          trailing: DateFormatUtils.getMonthDayYear(cryptocurrency.athDate),
        ),
      ],
    );
  }
}
