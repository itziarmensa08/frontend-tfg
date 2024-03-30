import 'package:frontend_tfg/pages/add_user/add_user.binding.dart';
import 'package:frontend_tfg/pages/add_user/add_user.page.dart';
import 'package:frontend_tfg/pages/admin/admin.binding.dart';
import 'package:frontend_tfg/pages/admin/admin.page.dart';
import 'package:frontend_tfg/pages/home/home.binding.dart';
import 'package:frontend_tfg/pages/home/home.page.dart';
import 'package:frontend_tfg/pages/list_users/list_users.binding.dart';
import 'package:frontend_tfg/pages/list_users/list_users.page.dart';
import 'package:frontend_tfg/pages/login/login.binding.dart';
import 'package:frontend_tfg/pages/login/login.page.dart';
import 'package:frontend_tfg/pages/new_analysis/new_analysis.binding.dart';
import 'package:frontend_tfg/pages/new_analysis/new_analysis.page.dart';
import 'package:frontend_tfg/pages/profile/profile.binding.dart';
import 'package:frontend_tfg/pages/profile/profile.page.dart';
import 'package:frontend_tfg/pages/register/register.binding.dart';
import 'package:frontend_tfg/pages/register/register.page.dart';
import 'package:frontend_tfg/pages/splash/splash.binding.dart';
import 'package:frontend_tfg/pages/splash/splash.page.dart';
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
      name: Routes.register,
      page:() => const RegisterPage(),
      binding: RegisterBinding()
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
    GetPage(
      name: Routes.profile,
      page:() => const ProfilePage(),
      binding: ProfileBinding()
    ),
    GetPage(
      name: Routes.admin,
      page:() => const AdminPage(),
      binding: AdminBinding()
    ),
    GetPage(
      name: Routes.listUsers,
      page:() => const ListUsersPage(),
      binding: ListUsersBinding()
    ),
    GetPage(
      name: Routes.addUser,
      page:() => const AddUserPage(),
      binding: AddUserBinding()
    ),
  ];
}