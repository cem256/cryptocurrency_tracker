import 'package:cryptocurrency_tracker/app/l10n/app_l10n.dart';
import 'package:cryptocurrency_tracker/app/router/app_router.dart';
import 'package:cryptocurrency_tracker/app/router/custom_route_observer.dart';
import 'package:cryptocurrency_tracker/app/theme/cubit/theme_cubit.dart';
import 'package:cryptocurrency_tracker/app/theme/dark/dark_theme.dart';
import 'package:cryptocurrency_tracker/app/theme/light/light_theme.dart';
import 'package:cryptocurrency_tracker/core/extensions/context_extensions.dart';
import 'package:cryptocurrency_tracker/core/utils/observer/custom_bloc_observer.dart';
import 'package:cryptocurrency_tracker/feature/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:cryptocurrency_tracker/locator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  final widgetBinding = WidgetsFlutterBinding.ensureInitialized();
  // Initialize Flutter Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);
  // Initialize Bloc Observer
  Bloc.observer = CustomBlocObserver();
  // Initialize Hydrated Bloc for Caching Theme Preference
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  // Initialize Hive
  await Hive.initFlutter();
  // Initialize Locator
  await Locator.locateServices();
  // Initialize Easy Localization
  await EasyLocalization.ensureInitialized();
  // Set Screen Orientation
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  runApp(
    EasyLocalization(
      path: AppL10n.path,
      supportedLocales: AppL10n.supportedLocales,
      fallbackLocale: AppL10n.en,
      child: CryptocurrencyTracker(),
    ),
  );
}

class CryptocurrencyTracker extends StatelessWidget {
  CryptocurrencyTracker({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Injecting ThemeCubit and FavoritesBloc to the widget tree
        BlocProvider(
          create: (_) => ThemeCubit(),
        ),
        BlocProvider(
          create: (_) => Locator.instance<FavoritesCubit>(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,

            // Theme
            theme: LightTheme().theme,
            darkTheme: DarkTheme().theme,
            themeMode: themeState.themeMode,

            // Localization
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,

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
