
import 'package:frontend_tfg/data/models/airport_model.dart';
import 'package:frontend_tfg/data/services/airport.service.dart';
import 'package:frontend_tfg/pages/list_airports/list_airports.controller.dart';
import 'package:get/get.dart';

class ListAirportsBinding implements Bindings {
  @override
  Future<void> dependencies() async {

    final ListAirportsController controller = Get.put(ListAirportsController());

    List<AirportModel>? airports = await AirportService.getAirports();

    if (airports != null) {
      controller.airports.value = airports;
      controller.filteredairports.value = airports;
    }


  }
}