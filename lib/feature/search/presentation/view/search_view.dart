import 'package:auto_route/auto_route.dart';
import 'package:cryptocurrency_tracker/app/l10n/app_l10n.g.dart';
import 'package:cryptocurrency_tracker/app/widgets/list_tile/custom_list_tile.dart';
import 'package:cryptocurrency_tracker/app/widgets/text/centered_text.dart';
import 'package:cryptocurrency_tracker/core/extensions/context_extensions.dart';
import 'package:cryptocurrency_tracker/feature/search/domain/entities/search_entity.dart';
import 'package:cryptocurrency_tracker/feature/search/presentation/bloc/search_bloc.dart';
import 'package:cryptocurrency_tracker/injection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';

part '../widgets/search_text_field.dart';
part '../widgets/success_widget.dart';

@RoutePage()
class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchBloc>(),
      child: const _SearchViewBody(),
    );
  }
}

class _SearchViewBody extends StatelessWidget {
  const _SearchViewBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const _SearchTextField(),
      ),
      body: SafeArea(
        child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            return switch (state.status) {
              SearchStatus.initial => CenteredText(
                  text: LocaleKeys.search_view_enter_name_or_symbol.tr(),
                ),
              SearchStatus.loading => const UIKitAdaptiveIndicator(),
              SearchStatus.failure => CenteredText(
                  text: LocaleKeys.errors_somethingWentWrong.tr(),
                ),
              SearchStatus.noResult => CenteredText(
                  text: LocaleKeys.search_view_no_results_found.tr(args: [state.query]),
                ),
              SearchStatus.success => _SuccessWidget(
                  cryptocurrencies: state.cryptocurrencies,
                )
            };
          },
        ),
      ),
    );
  }
}
