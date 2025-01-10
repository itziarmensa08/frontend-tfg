import 'package:frontend_tfg/pages/confirm/confirm.controller.dart';
import 'package:get/get.dart';

class ConfirmBinding implements Bindings {

  @override
  Future<void> dependencies() async {
    final Map parameters = Get.parameters;
    if (parameters['id'] != null) {
      final controller = Get.put(ConfirmController());
      controller.userId.value = parameters['id'];
    }
  }

}