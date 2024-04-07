
import 'package:frontend_tfg/data/models/aircraft_model.dart';
import 'package:frontend_tfg/data/services/aircraft.service.dart';
import 'package:frontend_tfg/pages/list_aircrafts/list_aircrafts.controller.dart';
import 'package:get/get.dart';

class ListAircraftsBinding implements Bindings {
  @override
  Future<void> dependencies() async {

    final ListAircraftsController controller = Get.put(ListAircraftsController());

    List<AircraftModel>? aircrafts = await AircraftService.getAircrafts();

    if (aircrafts != null) {
      controller.aircrafts.value = aircrafts;
    }


  }
}