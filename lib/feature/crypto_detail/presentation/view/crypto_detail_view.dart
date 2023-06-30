import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/app/widgets/failure/failure_widget.dart';
import 'package:crypto_app/core/enums/page_status.dart';
import 'package:crypto_app/feature/crypto_detail/presentation/bloc/crypto_detail_bloc.dart';
import 'package:crypto_app/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        create: (context) => getIt<CryptoDetailBloc>()..add(CryptoDetailEvent.onCryptoDetailFetched(id: id)),
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
      child: BlocBuilder<CryptoDetailBloc, CryptoDetailState>(
        builder: (context, state) {
          return switch (state.status) {
            PageStatus.initial => const Center(child: CircularProgressIndicator.adaptive()),
            PageStatus.failure => FailureWidget(
                onPressed: () => context.read<CryptoDetailBloc>().add(CryptoDetailEvent.onCryptoDetailFetched(id: id)),
              ),
            PageStatus.success => const Center(child: Text('Success'))
          };
        },
      ),
    );
  }
}
