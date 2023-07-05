import 'package:cryptocurrency_tracker/core/extensions/context_extensions.dart';
import 'package:cryptocurrency_tracker/feature/favorites/domain/models/favorite_entity.dart';
import 'package:cryptocurrency_tracker/feature/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesButton extends StatelessWidget {
  const FavoritesButton({
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
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => context.read<FavoritesCubit>().favoritesButtonClicked(
                FavoriteEntity(id: id, symbol: symbol, name: name, image: image, marketCapRank: marketCapRank),
              ),
          child: Icon(
            Icons.star,
            color: state.favorites.any((favorite) => favorite.id == id)
                ? context.theme.colorScheme.primary
                : context.theme.colorScheme.outline,
          ),
        );
      },
    );
  }
}
