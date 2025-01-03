import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend_tfg/pages/splash/splash.binding.dart';
import 'package:frontend_tfg/pages/splash/splash.page.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:frontend_tfg/translations/app.translations.dart';
import 'package:get/get.dart';
import 'package:json_theme/json_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  final themeStr = await rootBundle.loadString('assets/appainter_theme.json');
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;
  runApp(MyApp(
    theme: theme,
    prefs: prefs,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.theme, required this.prefs});
  final ThemeData theme;
  final SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'EOSID program',
      theme: theme,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initial,
      getPages: AppPages.pages,
      home: const SplashScreenPage(),
      initialBinding: SplashScreenBinding(),
      defaultTransition: Transition.noTransition,
      locale: Locale(prefs.getString('language') ?? 'es'),
      translationsKeys: AppTranslation.translations,
    );
  }
}