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
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cryptocurrency.name,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(cryptocurrency.symbol.toUpperCase()),
              ],
            ),
          ),
          Text('#${cryptocurrency.marketCapRank}')
        ],
      ),
    );
  }
}
