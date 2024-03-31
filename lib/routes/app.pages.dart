import 'package:frontend_tfg/pages/add_aircraft/add_aircraft.binding.dart';
import 'package:frontend_tfg/pages/add_aircraft/add_aircraft.page.dart';
import 'package:frontend_tfg/pages/add_airport/add_airport.binding.dart';
import 'package:frontend_tfg/pages/add_airport/add_airport.page.dart';
import 'package:frontend_tfg/pages/add_user/add_user.binding.dart';
import 'package:frontend_tfg/pages/add_user/add_user.page.dart';
import 'package:frontend_tfg/pages/admin/admin.binding.dart';
import 'package:frontend_tfg/pages/admin/admin.page.dart';
import 'package:frontend_tfg/pages/edit_aircraft/edit_aircraft.binding.dart';
import 'package:frontend_tfg/pages/edit_aircraft/edit_aircraft.page.dart';
import 'package:frontend_tfg/pages/edit_airport/edit_airport.binding.dart';
import 'package:frontend_tfg/pages/edit_airport/edit_airport.page.dart';
import 'package:frontend_tfg/pages/edit_user/edit_user.binding.dart';
import 'package:frontend_tfg/pages/edit_user/edit_user.page.dart';
import 'package:frontend_tfg/pages/home/home.binding.dart';
import 'package:frontend_tfg/pages/home/home.page.dart';
import 'package:frontend_tfg/pages/list_aircrafts/list_aircrafts.binding.dart';
import 'package:frontend_tfg/pages/list_aircrafts/list_aircrafts.page.dart';
import 'package:frontend_tfg/pages/list_airports/list_airports.binding.dart';
import 'package:frontend_tfg/pages/list_airports/list_airports.page.dart';
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
    GetPage(
      name: Routes.editUser,
      page:() => const EditUserPage(),
      binding: EditUserBinding()
    ),
    GetPage(
      name: Routes.listAircrafts,
      page:() => const ListAircraftsPage(),
      binding: ListAircraftsBinding()
    ),
    GetPage(
      name: Routes.addAircraft,
      page:() => const AddAircraftPage(),
      binding: AddAircraftBinding()
    ),
    GetPage(
      name: Routes.editAircraft,
      page:() => const EditAircraftPage(),
      binding: EditAircraftBinding()
    ),
    GetPage(
      name: Routes.listAirports,
      page:() => const ListAirportsPage(),
      binding: ListAirportsBinding()
    ),
    GetPage(
      name: Routes.addAirport,
      page:() => const AddAirportPage(),
      binding: AddAirportBinding()
    ),
    GetPage(
      name: Routes.editAirport,
      page:() => const EditAirportPage(),
      binding: EditAirportBinding()
    ),
  ];
}