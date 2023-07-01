import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/app/widgets/failure/failure_widget.dart';
import 'package:crypto_app/app/widgets/text/text_large.dart';
import 'package:crypto_app/app/widgets/text/text_normal.dart';
import 'package:crypto_app/app/widgets/text/text_small.dart';
import 'package:crypto_app/core/enums/page_status.dart';
import 'package:crypto_app/core/extensions/context_extensions.dart';
import 'package:crypto_app/core/extensions/widget_extensions.dart';
import 'package:crypto_app/core/utils/date_format/date_format_utils.dart';
import 'package:crypto_app/core/utils/number_format/number_format_utils.dart';
import 'package:crypto_app/feature/crypto_detail/domain/entities/crypto_detail_entity.dart';
import 'package:crypto_app/feature/crypto_detail/presentation/cubit/crypto_detail_cubit.dart';
import 'package:crypto_app/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';

part '../widgets/detail_card.dart';
part '../widgets/detail_list_tile.dart';
part '../widgets/overview_card.dart';
part '../widgets/section_details.dart';
part '../widgets/section_historical_data.dart';
part '../widgets/success_widget.dart';

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
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.star_outline),
          )
        ],
      ),
      body: BlocProvider(
        create: (context) => getIt<CryptoDetailCubit>()..fetchCryptoDetail(id: id),
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
            PageStatus.loading => const Center(child: CircularProgressIndicator.adaptive()),
            PageStatus.failure => FailureWidget(
                onPressed: () => context.read<CryptoDetailCubit>().fetchCryptoDetail(id: id),
              ),
            PageStatus.success => _SuccessWidget(
                cryptocurrency: state.cryptocurrency,
              )
          };
        },
      ),
    );
  }
}
