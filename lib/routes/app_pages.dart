import 'package:frontend_tfg/pages/home/home_binding.dart';
import 'package:frontend_tfg/pages/home/home_page.dart';
import 'package:frontend_tfg/pages/login/login.binding.dart';
import 'package:frontend_tfg/pages/login/login.page.dart';
import 'package:frontend_tfg/pages/new_analysis/new_analysis_binding.dart';
import 'package:frontend_tfg/pages/new_analysis/new_analysis_page.dart';
import 'package:frontend_tfg/pages/splash/splash_binding.dart';
import 'package:frontend_tfg/pages/splash/splash_page.dart';
import 'package:get/get.dart';
part './routes.dart';

abstract class AppPages {

  static final pages = [
    GetPage(
      name: Routes.initial,
      page:() => const SplashScreenPage(),
      binding: SplashScreenBinding()
    ),
    GetPage(
      name: Routes.login,
      page:() => const LoginPage(),
      binding: LoginBinding()
    ),
    GetPage(
      name: Routes.home,
      page:() => const HomePage(),
      binding: HomeBinding()
    ),
    GetPage(
      name: Routes.newAnalysis,
      page:() => const NewAnalysisPage(),
      binding: NewAnalysisBinding()
    ),
  ];
}