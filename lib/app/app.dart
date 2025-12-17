import 'package:craft_buy/app/app_routes.dart';
import 'package:craft_buy/app/app_theme.dart';
import 'package:craft_buy/app/providers/language_provider.dart';
import 'package:craft_buy/app/providers/theme_provider.dart';
import 'package:craft_buy/feature/auth/presentation/screen/splash_screen.dart';
import 'package:craft_buy/feature/common/prsentation/providers/main_nav_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class CraftyBayApp extends StatefulWidget {
  const CraftyBayApp({super.key});

  @override
  State<CraftyBayApp> createState() => _CraftyBayAppState();
}

class _CraftyBayAppState extends State<CraftyBayApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LanguageProvider()..loadInitialLanguage(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider()..loadInitialThemeMode(),
        ),
        ChangeNotifierProvider(create: (_) => MainNavContainerProvider()),
      ],
      child: Consumer<LanguageProvider>(
        builder: (context, languageProvider, child) {
          return Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return MaterialApp(
                initialRoute: SplashScreen.name,
                onGenerateRoute: AppRoutes.routes,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeProvider.currentThemeMode,
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: [Locale('en'), Locale('bn'), Locale('de')],
                locale: languageProvider.currentLocale,
              );
            },
          );
        },
      ),
    );
  }
}
