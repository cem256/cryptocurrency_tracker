part of '../view/crypto_view.dart';

class _FailureWidget extends StatelessWidget {
  const _FailureWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Something Went Wrong'),
          SizedBox(height: context.mediumValue),
          TextButton.icon(
            onPressed: () => context.read<CryptoBloc>().add(const CryptoEvent.onCryptocurrenciesFetched()),
            icon: const Icon(Icons.refresh_outlined),
            label: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
