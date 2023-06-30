import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/app/router/app_router.gr.dart';
import 'package:crypto_app/core/extensions/context_extensions.dart';
import 'package:crypto_app/feature/crypto/domain/entities/crypto_entity.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class CryptoListTile extends StatelessWidget {
  const CryptoListTile({required this.cryptocurrency, super.key});

  final CryptoEntity cryptocurrency;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context.router.push(const CryptoDetailRoute()),
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
                Text(
                  cryptocurrency.name,
                  overflow: TextOverflow.ellipsis,
                ),
                Text('${cryptocurrency.marketCapRank}. ${cryptocurrency.symbol.toUpperCase()}'),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('\$${cryptocurrency.currentPrice}'),
              Text(
                '${cryptocurrency.priceChange24h.toStringAsFixed(2)}%',
                style: TextStyle(
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
