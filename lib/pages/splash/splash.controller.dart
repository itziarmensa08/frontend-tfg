
import 'package:frontend_tfg/data/services/user.service.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {


  final UserService userService = UserService();

  var isUserLoggedIn = false.obs;

  Future<void> checkUser() async {
    isUserLoggedIn.value = await userService.getUserLogged();
    if (isUserLoggedIn.value == true) {
      Get.toNamed(Routes.home);
    } else {
      Get.toNamed(Routes.login);
    }
  }

}