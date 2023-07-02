part of '../view/crypto_view.dart';

class _SuccessWidget extends StatefulWidget {
  const _SuccessWidget({required this.cryptocurrencies, required this.hasReachedMax});

  final List<CryptoEntity> cryptocurrencies;
  final bool hasReachedMax;

  @override
  State<_SuccessWidget> createState() => _SuccessWidgetState();
}

class _SuccessWidgetState extends State<_SuccessWidget> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_scrollListener)
      ..dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (!_scrollController.hasClients) return;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (currentScroll == maxScroll) {
      context.read<CryptoBloc>().add(const CryptoEvent.onCryptocurrenciesFetched());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAllLow,
      child: ListView.separated(
        controller: _scrollController,
        itemCount: widget.hasReachedMax ? widget.cryptocurrencies.length : widget.cryptocurrencies.length + 1,
        itemBuilder: (context, index) {
          return index >= widget.cryptocurrencies.length
              ? const UIKitAdaptiveIndicator()
              : CryptoListTile(cryptocurrency: widget.cryptocurrencies[index]);
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}
