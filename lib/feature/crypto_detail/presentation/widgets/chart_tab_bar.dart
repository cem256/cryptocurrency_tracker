part of '../view/crypto_detail_view.dart';

class _ChartTabBar extends StatefulWidget {
  const _ChartTabBar();

  @override
  State<_ChartTabBar> createState() => _ChartTabBarState();
}

class _ChartTabBarState extends State<_ChartTabBar> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      tabs: const [
        Tab(
          text: '24h',
        ),
        Tab(
          text: '7d',
        ),
        Tab(
          text: '1m',
        ),
        Tab(
          text: '1y',
        )
      ],
    );
  }
}
