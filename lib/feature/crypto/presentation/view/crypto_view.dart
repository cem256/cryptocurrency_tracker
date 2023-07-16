import 'package:auto_route/auto_route.dart';
import 'package:cryptocurrency_tracker/app/l10n/app_l10n.g.dart';
import 'package:cryptocurrency_tracker/app/router/app_router.gr.dart';
import 'package:cryptocurrency_tracker/app/theme/cubit/theme_cubit.dart';
import 'package:cryptocurrency_tracker/app/widgets/button/favorites_button.dart';
import 'package:cryptocurrency_tracker/app/widgets/failure/failure_widget.dart';
import 'package:cryptocurrency_tracker/app/widgets/text/text_normal.dart';
import 'package:cryptocurrency_tracker/app/widgets/text/text_small.dart';
import 'package:cryptocurrency_tracker/core/enums/view_status.dart';
import 'package:cryptocurrency_tracker/core/extensions/context_extensions.dart';
import 'package:cryptocurrency_tracker/core/utils/number_format/number_format_utils.dart';
import 'package:cryptocurrency_tracker/feature/crypto/domain/entities/crypto_entity.dart';
import 'package:cryptocurrency_tracker/feature/crypto/presentation/bloc/crypto_bloc.dart';
import 'package:cryptocurrency_tracker/locator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';

part '../widgets/app_bar.dart';
part '../widgets/crypto_list_tile.dart';
part '../widgets/crypto_success_widget.dart';

@RoutePage()
class CryptoView extends StatelessWidget {
  const CryptoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AppBar(),
      body: BlocProvider(
        create: (context) => Locator.instance<CryptoBloc>()..add(const CryptoEvent.onCryptocurrenciesFetched()),
        child: const _CryptoViewBody(),
      ),
    );
  }
}

class _CryptoViewBody extends StatelessWidget {
  const _CryptoViewBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoBloc, CryptoState>(
      builder: (context, state) {
        return switch (state.status) {
          ViewStatus.loading => const UIKitAdaptiveIndicator(),
          ViewStatus.success => _CryptoSuccessWidget(
              cryptocurrencies: state.cryptocurrencies,
              hasReachedMax: state.hasReachedMax,
            ),
          ViewStatus.failure => FailureWidget(
              onPressed: () => context.read<CryptoBloc>().add(
                    const CryptoEvent.onCryptocurrenciesFetched(),
                  ),
            )
        };
      },
    );
  }
}
