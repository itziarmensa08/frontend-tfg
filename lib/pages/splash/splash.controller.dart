
import 'package:frontend_tfg/data/models/auth.model.dart';
import 'package:frontend_tfg/data/services/user.service.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {


  final UserService userService = UserService();

  var isUserLoggedIn = false.obs;

  Future<void> checkUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isUserLoggedIn.value = await userService.getUserLogged();
    if (isUserLoggedIn.value == true) {
      Auth.id = prefs.getString('id');
      Auth.token = prefs.getString('token');
      Auth.language = prefs.getString('language');
      Auth.isAdmin = prefs.getBool('isAdmin')!;
      Get.toNamed(Routes.home);
    } else {
      Get.toNamed(Routes.login);
    }
  }

}