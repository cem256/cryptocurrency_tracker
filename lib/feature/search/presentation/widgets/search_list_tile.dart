part of '../view/search_view.dart';

class _SearchListTile extends StatelessWidget {
  const _SearchListTile({required this.cryptocurrency});

  final SearchEntity cryptocurrency;

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
                TextNormal(
                  cryptocurrency.name,
                  overflow: TextOverflow.ellipsis,
                ),
                TextNormal(cryptocurrency.symbol.toUpperCase()),
              ],
            ),
          ),
          TextNormal('#${cryptocurrency.marketCapRank}')
        ],
      ),
    );
  }
}
