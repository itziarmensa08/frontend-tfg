
import 'package:frontend_tfg/data/models/aircraft_model.dart';
import 'package:frontend_tfg/data/models/airport_model.dart';
import 'package:frontend_tfg/data/services/aircraft.service.dart';
import 'package:frontend_tfg/data/services/airport.service.dart';
import 'package:frontend_tfg/pages/new_analysis/new_analysis.controller.dart';
import 'package:get/get.dart';

class NewAnalysisBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    final NewAnalaysisController controller = Get.put(NewAnalaysisController());

    await getAircraftList(controller);
    await getAirportsList(controller);

  }

  getAirportsList (NewAnalaysisController controller) async {
    List<AirportModel>? airports = await AirportService.getAirports();

    if (airports != null) {
      controller.airports.value = airports;
    }
  }

  getAircraftList (NewAnalaysisController controller) async {
    List<AircraftModel>? aircrafts = await AircraftService.getAircrafts();

    if (aircrafts != null) {
      controller.aircrafts.value = aircrafts;
    }
  }
}