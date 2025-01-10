import 'package:frontend_tfg/pages/restore_pass/restore.controller..dart';
import 'package:get/get.dart';

class RestorePassBinding implements Bindings {

  @override
  Future<void> dependencies() async {
    final Map parameters = Get.parameters;
    if (parameters['id'] != null) {
      final controller = Get.put(RestorePassController());
      controller.userId.value = parameters['id'];
    }
  }

}