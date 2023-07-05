import 'package:auto_route/auto_route.dart';
import 'package:cryptocurrency_tracker/app/l10n/app_l10n.g.dart';
import 'package:cryptocurrency_tracker/app/router/app_router.gr.dart';
import 'package:cryptocurrency_tracker/app/widgets/button/favorites_button.dart';
import 'package:cryptocurrency_tracker/app/widgets/failure/failure_widget.dart';
import 'package:cryptocurrency_tracker/app/widgets/text/centered_text.dart';
import 'package:cryptocurrency_tracker/app/widgets/text/text_normal.dart';
import 'package:cryptocurrency_tracker/core/extensions/context_extensions.dart';
import 'package:cryptocurrency_tracker/feature/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';

part '../widgets/favorites_list_tile.dart';

@RoutePage()
class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.favorites_view_appbar_title.tr()),
      ),
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          return switch (state.status) {
            FavoritesStatus.loading => const Center(
                child: UIKitAdaptiveIndicator(),
              ),
            FavoritesStatus.empty => CenteredText(text: LocaleKeys.favorites_view_noFavorites.tr()),
            FavoritesStatus.failure => FailureWidget(onPressed: () => context.read<FavoritesCubit>().getFavorites()),
            FavoritesStatus.success => Padding(
                padding: context.paddingAllDefault,
                child: ListView.builder(
                  itemCount: state.favorites.length,
                  itemBuilder: (context, index) {
                    final favorites = state.favorites[index];
                    return _FavoritesListTile(
                      id: favorites.id,
                      name: favorites.name,
                      symbol: favorites.symbol,
                      image: favorites.image,
                      marketCapRank: favorites.marketCapRank,
                    );
                  },
                ),
              )
          };
        },
      ),
    );
  }
}
