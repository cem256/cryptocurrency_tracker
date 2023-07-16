import 'package:auto_route/auto_route.dart';
import 'package:cryptocurrency_tracker/app/l10n/app_l10n.g.dart';
import 'package:cryptocurrency_tracker/app/widgets/button/favorites_button.dart';
import 'package:cryptocurrency_tracker/app/widgets/failure/failure_widget.dart';
import 'package:cryptocurrency_tracker/app/widgets/text/text_large.dart';
import 'package:cryptocurrency_tracker/app/widgets/text/text_normal.dart';
import 'package:cryptocurrency_tracker/app/widgets/text/text_small.dart';
import 'package:cryptocurrency_tracker/core/enums/view_status.dart';
import 'package:cryptocurrency_tracker/core/extensions/context_extensions.dart';
import 'package:cryptocurrency_tracker/core/extensions/widget_extensions.dart';
import 'package:cryptocurrency_tracker/core/utils/date_format/date_format_utils.dart';
import 'package:cryptocurrency_tracker/core/utils/number_format/number_format_utils.dart';
import 'package:cryptocurrency_tracker/feature/crypto_detail/domain/entities/crypto_detail_entity.dart';
import 'package:cryptocurrency_tracker/feature/crypto_detail/presentation/cubit/crypto_detail_cubit.dart';
import 'package:cryptocurrency_tracker/locator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';

part '../widgets/detail_card.dart';
part '../widgets/detail_list_tile.dart';
part '../widgets/overview_card.dart';
part '../widgets/section_details.dart';
part '../widgets/section_historical_data.dart';
part '../widgets/crypto_detail_success_widget.dart';

@RoutePage()
class CryptoDetailView extends StatelessWidget {
  const CryptoDetailView({required this.id, required this.name, super.key});

  final String id;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: BlocProvider(
        create: (context) => Locator.instance<CryptoDetailCubit>()..fetchCryptoDetail(id: id),
        child: _CryptoDetailViewBody(id: id),
      ),
    );
  }
}

class _CryptoDetailViewBody extends StatelessWidget {
  const _CryptoDetailViewBody({required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<CryptoDetailCubit, CryptoDetailState>(
        builder: (context, state) {
          return switch (state.status) {
            ViewStatus.loading => const UIKitAdaptiveIndicator(),
            ViewStatus.failure => FailureWidget(
                onPressed: () => context.read<CryptoDetailCubit>().fetchCryptoDetail(id: id),
              ),
            ViewStatus.success => _CryptoDetailSuccessWidget(
                cryptocurrency: state.cryptocurrency,
              )
          };
        },
      ),
    );
  }
}
