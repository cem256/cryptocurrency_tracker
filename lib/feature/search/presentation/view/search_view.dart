import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/app/router/app_router.gr.dart';
import 'package:crypto_app/core/extensions/context_extensions.dart';
import 'package:crypto_app/feature/search/domain/entities/search_entity.dart';
import 'package:crypto_app/feature/search/presentation/bloc/search_bloc.dart';
import 'package:crypto_app/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';

part '../widgets/search_text_field.dart';
part '../widgets/search_list_tile.dart';
part '../widgets/success_widget.dart';
part '../widgets/centered_text.dart';

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
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          return switch (state.status) {
            SearchStatus.initial => const _CenteredText(
                text: 'Enter a cryptocurrency name or symbol to get started.',
              ),
            SearchStatus.loading => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            SearchStatus.failure => const _CenteredText(
                text: 'Oops! Something went wrong.',
              ),
            SearchStatus.noResult => _CenteredText(
                text: "No results found for '${state.query}'",
              ),
            SearchStatus.success => _SuccessWidget(
                cryptocurrencies: state.cryptocurrencies,
              )
          };
        },
      ),
    );
  }
}
