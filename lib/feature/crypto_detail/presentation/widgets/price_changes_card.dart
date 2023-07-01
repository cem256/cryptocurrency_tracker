part of '../view/crypto_detail_view.dart';

class _PriceChangeCard extends StatelessWidget {
  const _PriceChangeCard({required this.timePeriod, required this.priceChange});

  final String timePeriod;
  final double priceChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextSmall(timePeriod),
        SizedBox(height: context.lowValue),
        Card(
          color: priceChange.isNegative
              ? context.theme.colorScheme.errorContainer
              : context.theme.colorScheme.primaryContainer,
          child: Padding(
            padding: context.paddingAllLow,
            child: TextNormal(priceChange.toStringAsFixed(2)),
          ),
        ),
      ],
    );
  }
}
