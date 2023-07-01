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
          leading: 'ATH',
          trailing: NumberFormatUtils.getCurrency(value: cryptocurrency.ath),
        ),
        const Divider(),
        _DetailListTile(
          leading: 'ATH Change',
          trailing: '${cryptocurrency.athChange}%',
        ),
        const Divider(),
        _DetailListTile(
          leading: 'ATH Date',
          trailing: DateFormatUtils.getMonthDayYear(cryptocurrency.athDate),
        ),
      ],
    );
  }
}
