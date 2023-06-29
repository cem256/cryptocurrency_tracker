import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/app/router/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NavbarView extends StatelessWidget {
  const NavbarView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        CryptoRoute(),
        FavoritesRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.store_outlined),
              label: 'Markets',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_outline),
              label: 'Favorites',
            ),
          ],
        );
      },
    );
  }
}
