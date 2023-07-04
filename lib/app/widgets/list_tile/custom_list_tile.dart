import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/app/router/app_router.gr.dart';
import 'package:crypto_app/app/widgets/button/favorites_button.dart';
import 'package:crypto_app/app/widgets/text/text_normal.dart';
import 'package:crypto_app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/widgets/image/ui_kit_network_image.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    required this.id,
    required this.name,
    required this.symbol,
    required this.image,
    required this.marketCapRank,
    super.key,
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
          FavoritesButton(
            id: id,
            name: name,
            symbol: symbol,
            image: image,
            marketCapRank: marketCapRank,
          ),
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
          TextNormal('#$marketCapRank')
        ],
      ),
    );
  }
}