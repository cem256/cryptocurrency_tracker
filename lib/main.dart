import 'package:crypto_app/app/constants/string_constants.dart';
import 'package:crypto_app/app/l10n/l10n.dart';
import 'package:crypto_app/app/router/app_router.dart';
import 'package:crypto_app/app/router/custom_route_observer.dart';
import 'package:crypto_app/app/theme/cubit/theme_cubit.dart';
import 'package:crypto_app/app/theme/dark/dark_theme.dart';
import 'package:crypto_app/app/theme/light/light_theme.dart';
import 'package:crypto_app/core/extensions/context_extensions.dart';
import 'package:crypto_app/injection.dart' as sl;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await sl.initDependencies();

  runApp(CryptoApp());
}

class CryptoApp extends StatelessWidget {
  CryptoApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp.router(
            // App Name
            title: StringConstants.appName,

            debugShowCheckedModeBanner: false,

            // Theme
            theme: LightTheme().theme,
            darkTheme: DarkTheme().theme,
            themeMode: themeState.themeMode,

            // Localization
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,

            // Routing
            routerConfig: _appRouter.config(
              navigatorObservers: () => [CustomRouteObserver()],
            ),

            builder: (context, child) => MediaQuery(
              // Disables font scaling and bold text
              data: context.mediaQuery.copyWith(textScaleFactor: 1, boldText: false),
              // Dismisses the keyboard globally
              child: GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                child: child,
              ),
            ),
          );
        },
      ),
    );
  }
}
