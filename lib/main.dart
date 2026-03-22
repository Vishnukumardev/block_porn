import 'package:block_porn/src/core/router/custom_app_router.dart';
import 'package:block_porn/src/core/router/custom_route_observer.dart';
import 'package:block_porn/src/shared/data/sources/app_shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'src/core/utils/injections.dart';
import 'src/core/helper/app_helper.dart';
import 'package:provider/provider.dart';
import 'src/shared/domain/entitles/language_enum.dart';
import 'src/core/styles/app_theme.dart';
import 'dart:async';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'firebase_options.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjections();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(ChangeNotifierProvider(create: (_) => AppNotifier(), child: MyApp()));
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
  void setLocale(LanguageEnum newLocale) {
    setState(() {
      locale = Locale(newLocale.name);
    });
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

  @override
  Widget build(BuildContext context) {
    TextScaler textScaler = TextScaler.linear(1.0);
    return Consumer<AppNotifier>(
      builder: (context, appNotifier, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: textScaler),
          child: MaterialApp.router(
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
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],

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
}

class AppNotifier extends ChangeNotifier {
  bool isDarkTheme = false;
  Future<void> _initialize() async {
    isDarkTheme = AppHelper.isDarkTheme();
    notifyListeners();
  }

  AppNotifier() {
    _initialize();
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

  void destroy() {
    dispose();
  }
}
