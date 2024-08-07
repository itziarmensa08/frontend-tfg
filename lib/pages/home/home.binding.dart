
import 'package:frontend_tfg/data/services/procedure.service.dart';
import 'package:frontend_tfg/pages/home/home.controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    final HomeController controller = Get.put(HomeController());
    var procedures = await ProcedureService.getAllProcedures();
    if (procedures != null) {
      controller.procedures.value = procedures;
    }
  }
}