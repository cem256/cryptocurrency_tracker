part of '../view/favorites_view.dart';

class _FavoritesListTile extends StatelessWidget {
  const _FavoritesListTile({
    required this.id,
    required this.name,
    required this.symbol,
    required this.image,
    required this.marketCapRank,
  });

  final String id;
  final String name;
  final String symbol;
  final String image;
  final int marketCapRank;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context.router.push(CryptoDetailRoute(id: id, name: name)),
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          UIKitNetworkImage(
            height: context.highValue,
            imageUrl: image,
            errorWidget: const Icon(Icons.error),
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
                  name,
                  overflow: TextOverflow.ellipsis,
                ),
                TextNormal(symbol.toUpperCase()),
              ],
            ),
          ),
          FavoritesButton(
            id: id,
            name: name,
            symbol: symbol,
            image: image,
            marketCapRank: marketCapRank,
          ),
        ],
      ),
    );
  }
}
