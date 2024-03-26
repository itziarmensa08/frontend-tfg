import 'package:frontend_tfg/data/services/user.service.dart';
import 'package:frontend_tfg/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {

  var isUserLoggedIn = false.obs;

  Future<void> checkUser() async {
    UserService userService = UserService();
    isUserLoggedIn.value = await userService.getUser();

    if (isUserLoggedIn.value == true) {
      Get.toNamed(Routes.home);
    } else {
      Get.toNamed(Routes.login);
    }
  }

}