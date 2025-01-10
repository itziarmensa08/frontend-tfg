
import 'package:frontend_tfg/data/services/procedure.service.dart';
import 'package:frontend_tfg/pages/home/home.controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final HomeController controller = Get.put(HomeController());
    controller.prefs.value = prefs;
    var airports = await ProcedureService.getAirportsWithProcedures();
    if (airports != null) {
      controller.airports.value = airports;
      controller.filteredairports.value = airports;
    }
  }
}