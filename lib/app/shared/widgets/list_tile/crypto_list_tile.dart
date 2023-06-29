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
            icon: const Icon(
              Icons.star,
            ),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _OverflowText(
                text: cryptocurrency.name,
              ),
              _OverflowText(
                text: '${cryptocurrency.marketCapRank}. ${cryptocurrency.symbol.toUpperCase()}',
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _OverflowText(
                text: '\$${cryptocurrency.currentPrice}',
              ),
              _OverflowText(
                text: '${cryptocurrency.priceChange24h.toStringAsFixed(2)}%',
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _OverflowText extends StatelessWidget {
  const _OverflowText({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, overflow: TextOverflow.clip);
  }
}
