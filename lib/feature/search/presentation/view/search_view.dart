import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/app/widgets/list_tile/custom_list_tile.dart';
import 'package:crypto_app/app/widgets/text/centered_text.dart';
import 'package:crypto_app/core/extensions/context_extensions.dart';
import 'package:crypto_app/feature/search/domain/entities/search_entity.dart';
import 'package:crypto_app/feature/search/presentation/bloc/search_bloc.dart';
import 'package:crypto_app/injection.dart';
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
              SearchStatus.initial => const CenteredText(
                  text: 'Enter a Cryptocurrency Name or Symbol',
                ),
              SearchStatus.loading => const UIKitAdaptiveIndicator(),
              SearchStatus.failure => const CenteredText(
                  text: 'Oops! Something went wrong.',
                ),
              SearchStatus.noResult => CenteredText(
                  text: "No Results Found for '${state.query}'",
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
