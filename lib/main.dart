import 'package:crypto_app/app/constants/string_constants.dart';
import 'package:crypto_app/app/l10n/l10n.dart';
import 'package:crypto_app/app/router/app_router.dart';
import 'package:crypto_app/app/router/custom_route_observer.dart';
import 'package:crypto_app/app/theme/dark/dark_theme.dart';
import 'package:crypto_app/app/theme/light/light_theme.dart';
import 'package:crypto_app/core/utils/observer/custom_bloc_observer.dart';
import 'package:crypto_app/injection.dart' as sl;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = CustomBlocObserver();
  await sl.initDependencies();

  runApp(CryptoApp());
}

class CryptoApp extends StatelessWidget {
  CryptoApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // App Name
      title: StringConstants.appName,

      debugShowCheckedModeBanner: false,

      // Theme
      theme: LightTheme().theme,
      darkTheme: DarkTheme().theme,

      // Localization
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      // Routing
      routerConfig: _appRouter.config(
        navigatorObservers: () => [CustomRouteObserver()],
      ),
    );
  }
}
