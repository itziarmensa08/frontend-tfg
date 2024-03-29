import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend_tfg/data/models/auth.model.dart';
import 'package:frontend_tfg/pages/splash/splash.binding.dart';
import 'package:frontend_tfg/pages/splash/splash.page.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:frontend_tfg/translations/app.translations.dart';
import 'package:get/get.dart';
import 'package:json_theme/json_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeStr = await rootBundle.loadString('assets/appainter_theme.json');
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;
  runApp(MyApp(
    theme: theme,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.theme});
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Frontend TFG',
      theme: theme,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initial,
      getPages: AppPages.pages,
      home: const SplashScreenPage(),
      initialBinding: SplashScreenBinding(),
      defaultTransition: Transition.noTransition,
      locale: Locale(Auth.language ?? 'es'),
      translationsKeys: AppTranslation.translations,
    );
  }
}