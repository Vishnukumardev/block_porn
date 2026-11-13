import 'dart:async';

import 'package:block_porn/src/core/router/custom_app_router.dart';
import 'package:block_porn/src/core/router/custom_route_observer.dart';
import 'package:block_porn/src/shared/data/sources/app_shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'generated/l10n.dart';
import 'src/core/helper/app_helper.dart';
import 'src/core/styles/app_theme.dart';
import 'src/core/utils/injections.dart';
import 'src/shared/domain/entitles/language_enum.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initInjections();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(ChangeNotifierProvider(create: (_) => AppNotifier(), child: MyApp()));
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppNotifier extends ChangeNotifier {
  bool isDarkTheme = false;
  AppNotifier() {
    _initialize();
  }

  void destroy() {
    dispose();
  }

  void update() {
    notifyListeners();
  }

  void updateTheme(bool isDark) {
    isDarkTheme = isDark;
    AppHelper.setDarkTheme(isDark);
    if (isDark) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    }
    notifyListeners();
  }

  Future<void> _initialize() async {
    isDarkTheme = AppHelper.isDarkTheme();
    notifyListeners();
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, LanguageEnum newLocale) {
    final _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
    sl<AppSharedPreferences>().setLang(newLocale);
  }
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  Locale locale = const Locale('en');
  final GlobalKey<ScaffoldMessengerState> snackBarKey =
      GlobalKey<ScaffoldMessengerState>();
  final _appRouter = CustomAppRouter();
  @override
  Widget build(BuildContext context) {
    TextScaler textScaler = TextScaler.linear(1.0);
    return Consumer<AppNotifier>(
      builder: (context, appNotifier, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: textScaler),
          child: MaterialApp.router(
            key: navigatorKey,
            routerConfig: _appRouter.config(
              navigatorObservers: () => [CustomRouteObserver()],
            ),
            scaffoldMessengerKey: snackBarKey,
            debugShowCheckedModeBanner: false,
            title: 'No Fap',
            theme: appTheme,
            darkTheme: darkTheme,
            themeMode: appNotifier.isDarkTheme
                ? ThemeMode.dark
                : ThemeMode.light,
            locale: locale,
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
            supportedLocales: S.delegate.supportedLocales,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).unfocus();
    });
    WidgetsBinding.instance.addObserver(this);
    if (mounted) {
      LanguageEnum newLocale = AppHelper.getLang();
      setState(() {
        locale = Locale(newLocale.local);
      });
    }
  }

  void setLocale(LanguageEnum newLocale) {
    setState(() {
      locale = Locale(newLocale.name);
    });
  }
}
