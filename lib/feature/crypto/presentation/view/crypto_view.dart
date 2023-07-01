import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/app/router/app_router.gr.dart';
import 'package:crypto_app/app/theme/cubit/theme_cubit.dart';
import 'package:crypto_app/app/widgets/failure/failure_widget.dart';
import 'package:crypto_app/app/widgets/text/text_normal.dart';
import 'package:crypto_app/app/widgets/text/text_small.dart';
import 'package:crypto_app/core/enums/page_status.dart';
import 'package:crypto_app/core/extensions/context_extensions.dart';
import 'package:crypto_app/core/utils/number_format/number_format_utils.dart';
import 'package:crypto_app/feature/crypto/domain/entities/crypto_entity.dart';
import 'package:crypto_app/feature/crypto/presentation/bloc/crypto_bloc.dart';
import 'package:crypto_app/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/widgets/image/ui_kit_network_image.dart';

part '../widgets/app_bar.dart';
part '../widgets/crypto_list_tile.dart';
part '../widgets/success_widget.dart';

@RoutePage()
class CryptoView extends StatelessWidget {
  const CryptoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AppBar(),
      body: BlocProvider(
        create: (context) => getIt<CryptoBloc>()..add(const CryptoEvent.onCryptocurrenciesFetched()),
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
          PageStatus.loading => const Center(child: CircularProgressIndicator.adaptive()),
          PageStatus.success => _SuccessWidget(
              cryptocurrencies: state.cryptocurrencies,
              hasReachedMax: state.hasReachedMax,
            ),
          PageStatus.failure => FailureWidget(
              onPressed: () => context.read<CryptoBloc>().add(
                    const CryptoEvent.onCryptocurrenciesFetched(),
                  ),
            )
        };
      },
    );
  }
}
