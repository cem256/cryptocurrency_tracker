import 'package:auto_route/auto_route.dart';
import 'package:cryptocurrency_tracker/app/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')

/// Holds all the routes that are defined in the app
/// Used to generate the Router object
final class AppRouter extends $AppRouter {
  @override
  List<AdaptiveRoute> get routes => [
        AdaptiveRoute(initial: true, page: SplashRoute.page),
        AdaptiveRoute(page: OnboardingRoute.page),
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
