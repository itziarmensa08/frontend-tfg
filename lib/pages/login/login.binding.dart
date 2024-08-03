import 'package:frontend_tfg/data/services/user.service.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {

  @override
  Future<void> dependencies() async {
    final Map parameters = Get.parameters;
    if (parameters['id'] != null) {
      final String userId = parameters['id'];
      if (userId != '0' && userId != ':id') {
        await UserService.validate(userId);
      }
    }
  }

}