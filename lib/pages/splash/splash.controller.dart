
import 'package:frontend_tfg/data/services/user.service.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {


  final UserService userService = UserService();

  var isUserLoggedIn = false.obs;

  Future<void> checkUser() async {
    String currentRoute = Get.currentRoute;
    isUserLoggedIn.value = await userService.getUserLoggedSplash();
    if (isUserLoggedIn.value == false) {
      Get.toNamed(Routes.login);
    } else if (currentRoute == '/') {
      Get.toNamed(Routes.home);
    }
  }

}