import 'package:frontend_tfg/data/models/auth.model.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {

  var isUserLoggedIn = false.obs;

  Future<void> checkUser() async {
    await Future.delayed(const Duration(seconds: 5));
    isUserLoggedIn.value = Auth.id == null ? false : true;

    if (isUserLoggedIn.value == true) {
      Get.toNamed(Routes.home);
    } else {
      Get.toNamed(Routes.login);
    }
  }

}