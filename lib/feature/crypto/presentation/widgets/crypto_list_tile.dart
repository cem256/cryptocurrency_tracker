part of '../view/crypto_view.dart';

class CryptoListTile extends StatelessWidget {
  const CryptoListTile({required this.cryptocurrency, super.key});

  final CryptoEntity cryptocurrency;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context.router.push(CryptoDetailRoute(id: cryptocurrency.id, name: cryptocurrency.name)),
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.star_outline),
            onPressed: () {},
          ),
          UIKitNetworkImage(
            height: context.highValue,
            imageUrl: cryptocurrency.image,
            errorWidget: const Icon(Icons.error_outline),
          ),
        ],
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextNormal(cryptocurrency.name),
                TextSmall('${cryptocurrency.marketCapRank}. ${cryptocurrency.symbol.toUpperCase()}'),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextNormal(
                NumberFormatUtils.getCurrency(value: cryptocurrency.currentPrice),
              ),
              TextNormal(
                '${cryptocurrency.priceChange24h.toStringAsFixed(2)}%',
                style: context.textTheme.bodyLarge?.copyWith(
                  color: cryptocurrency.priceChange24h.isNegative
                      ? context.theme.colorScheme.error
                      : context.theme.colorScheme.primary,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
