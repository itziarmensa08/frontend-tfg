
import 'package:frontend_tfg/data/services/procedure.service.dart';
import 'package:frontend_tfg/pages/home/home.controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    final HomeController controller = Get.put(HomeController());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');
    String? profileImage = prefs.getString('profileImage');
    if (username != null) controller.username.value = username;
    if (profileImage != null) controller.profileImage.value = profileImage;
    var airports = await ProcedureService.getAirportsWithProcedures();
    if (airports != null) {
      controller.airports.value = airports;
      controller.filteredairports.value = airports;
    }
  }
}