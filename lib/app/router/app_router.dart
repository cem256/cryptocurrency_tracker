import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/app/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter {
  @override
  List<AdaptiveRoute> get routes => [
        AdaptiveRoute(initial: true, page: OnboardingRoute.page),
        AdaptiveRoute(
          page: NavbarRoute.page,
          children: [
            AdaptiveRoute(
              initial: true,
              page: CryptoRoute.page,
            ),
            AdaptiveRoute(
              page: FavoritesRoute.page,
            )
          ],
        ),
        AdaptiveRoute(page: CryptoDetailRoute.page),
        AdaptiveRoute(page: SearchRoute.page)
      ];
}
