import 'package:flutter/widgets.dart';
import 'package:frontend_tfg/data/services/user.service.dart';
import 'package:frontend_tfg/pages/add_aircraft/add_aircraft.binding.dart';
import 'package:frontend_tfg/pages/add_aircraft/add_aircraft.page.dart';
import 'package:frontend_tfg/pages/add_airport/add_airport.binding.dart';
import 'package:frontend_tfg/pages/add_airport/add_airport.page.dart';
import 'package:frontend_tfg/pages/add_user/add_user.binding.dart';
import 'package:frontend_tfg/pages/add_user/add_user.page.dart';
import 'package:frontend_tfg/pages/admin/admin.binding.dart';
import 'package:frontend_tfg/pages/admin/admin.page.dart';
import 'package:frontend_tfg/pages/confirm/confirm.binding.dart';
import 'package:frontend_tfg/pages/confirm/confirm.page.dart';
import 'package:frontend_tfg/pages/edit_aircraft/edit_aircraft.binding.dart';
import 'package:frontend_tfg/pages/edit_aircraft/edit_aircraft.page.dart';
import 'package:frontend_tfg/pages/edit_airport/edit_airport.binding.dart';
import 'package:frontend_tfg/pages/edit_airport/edit_airport.page.dart';
import 'package:frontend_tfg/pages/edit_user/edit_user.binding.dart';
import 'package:frontend_tfg/pages/edit_user/edit_user.page.dart';
import 'package:frontend_tfg/pages/forgot_pass/forgot.binding.dart';
import 'package:frontend_tfg/pages/forgot_pass/forgot.page.dart';
import 'package:frontend_tfg/pages/home/home.binding.dart';
import 'package:frontend_tfg/pages/home/home.controller.dart';
import 'package:frontend_tfg/pages/home/home.page.dart';
import 'package:frontend_tfg/pages/home/list_aircrafts/list_aircrafts.binding.dart';
import 'package:frontend_tfg/pages/home/list_aircrafts/list_aircrafts.page.dart';
import 'package:frontend_tfg/pages/home/list_procedures/list_procedures.binding.dart';
import 'package:frontend_tfg/pages/home/list_procedures/list_procedures.page.dart';
import 'package:frontend_tfg/pages/home/procedure_detail/procedure_detail.binding.dart';
import 'package:frontend_tfg/pages/home/procedure_detail/procedure_detail.page.dart';
import 'package:frontend_tfg/pages/home/write_procedure/wirte_procedure.binding.dart';
import 'package:frontend_tfg/pages/home/write_procedure/write_procedure.page.dart';
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
import 'package:frontend_tfg/pages/restore_pass/restore.binding.dart';
import 'package:frontend_tfg/pages/restore_pass/restore.page.dart';
import 'package:frontend_tfg/pages/settings/pages/info/info.binding.dart';
import 'package:frontend_tfg/pages/settings/pages/info/info.page.dart';
import 'package:frontend_tfg/pages/settings/pages/notis/notifications.binding.dart';
import 'package:frontend_tfg/pages/settings/pages/notis/notifications.page.dart';
import 'package:frontend_tfg/pages/settings/pages/privacity/privacity.binding.dart';
import 'package:frontend_tfg/pages/settings/pages/privacity/privacity.page.dart';
import 'package:frontend_tfg/pages/settings/settings.binding.dart';
import 'package:frontend_tfg/pages/settings/settings.page.dart';
import 'package:frontend_tfg/pages/splash/splash.binding.dart';
import 'package:frontend_tfg/pages/splash/splash.page.dart';
import 'package:frontend_tfg/pages/tasks/tasks.binding.dart';
import 'package:frontend_tfg/pages/tasks/tasks.page.dart';
import 'package:get/get.dart';
part './routes.dart';

class AuthMiddleware extends GetMiddleware {
  final UserService userService = UserService();

  @override
  RouteSettings? redirect(String? route) {
    return null;
  }
}

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
      name: Routes.confirm,
      page:() => const ConfirmPage(),
      binding: ConfirmBinding()
    ),
    GetPage(
      name: Routes.forgotPass,
      page:() => const ForgotPassPage(),
      binding: ForgotPassBinding()
    ),
    GetPage(
      name: Routes.restorePass,
      page:() => const RestorePassPage(),
      binding: RestorePassBinding()
    ),
    GetPage(
      name: Routes.register,
      page:() => const RegisterPage(),
      binding: RegisterBinding()
    ),
    GetPage(
      name: Routes.home,
      page:() => const HomePage(),
      binding: HomeBinding(),
      middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: Routes.homeAircrafts,
      page:() => const ListAircraftsHomePage(),
      binding: ListAircraftsHomeBinding(),
      middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: Routes.homeProcedures,
      page:() => const ListProceduresHomePage(),
      binding: ListProceduresHomeBinding(),
      middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: Routes.homeProcedureDetail,
      page:() => const ProcedureDetailPage(),
      binding: ProcedureDetailBinding(),
      middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: Routes.homeProcedureWrite,
      page:() => const WriteProcedurePage(),
      binding: WriteProcedureBinding(),
      middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: Routes.newAnalysis,
      page:() => const NewAnalysisPage(),
      binding: NewAnalysisBinding(),
      middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: Routes.tasks,
      page:() => const TasksPage(),
      binding: TasksBinding(),
      middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: Routes.profile,
      page:() => const ProfilePage(),
      binding: ProfileBinding(),
      middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: Routes.admin,
      page:() => const AdminPage(),
      binding: AdminBinding(),
      middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: Routes.listUsers,
      page:() => const ListUsersPage(),
      binding: ListUsersBinding(),
      middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: Routes.addUser,
      page:() => const AddUserPage(),
      binding: AddUserBinding(),
      middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: Routes.editUser,
      page:() => const EditUserPage(),
      binding: EditUserBinding(),
      middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: Routes.listAircrafts,
      page:() => const ListAircraftsPage(),
      binding: ListAircraftsBinding(),
      middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: Routes.addAircraft,
      page:() => const AddAircraftPage(),
      binding: AddAircraftBinding(),
      middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: Routes.editAircraft,
      page:() => const EditAircraftPage(),
      binding: EditAircraftBinding(),
      middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: Routes.listAirports,
      page:() => const ListAirportsPage(),
      binding: ListAirportsBinding(),
      middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: Routes.addAirport,
      page:() => const AddAirportPage(),
      binding: AddAirportBinding(),
      middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: Routes.editAirport,
      page:() => const EditAirportPage(),
      binding: EditAirportBinding(),
      middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: Routes.settings,
      page:() => const SettingsPage(),
      binding: SettingsBinding(),
      middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: Routes.notis,
      page:() => const NotisPage(),
      binding: NotisBinding(),
      middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: Routes.help,
      page:() => const InfoPage(),
      binding: InfoBinding(),
      middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: Routes.privacity,
      page:() => const PrivacityPage(),
      binding: PrivacityBinding(),
      middlewares: [AuthMiddleware()]
    )
  ];
}