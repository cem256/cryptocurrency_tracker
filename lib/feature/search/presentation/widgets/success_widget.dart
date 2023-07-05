part of '../view/search_view.dart';

class _SuccessWidget extends StatelessWidget {
  const _SuccessWidget({required this.cryptocurrencies});

  final List<SearchEntity> cryptocurrencies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAllDefault,
      child: ListView.separated(
        itemCount: cryptocurrencies.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final cryptocurrency = cryptocurrencies[index];
          return _SearchListTile(
            id: cryptocurrency.id,
            name: cryptocurrency.name,
            symbol: cryptocurrency.symbol,
            image: cryptocurrency.image,
            marketCapRank: cryptocurrency.marketCapRank,
          );
        },
      ),
    );
  }
}
