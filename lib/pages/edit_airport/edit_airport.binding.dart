
import 'package:frontend_tfg/data/models/airport_model.dart';
import 'package:frontend_tfg/data/services/airport.service.dart';
import 'package:frontend_tfg/pages/edit_airport/edit_airport.controller.dart';
import 'package:get/get.dart';

class EditAirportBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    await updateAirportData();
  }

  static Future<void> updateAirportData() async {
    final controller = Get.put(EditAirportController());

    final Map arguments = Get.arguments;
    final String airportId = arguments['id'];
    final AirportModel? airport = await AirportService.getAirportById(airportId);
    if (airport != null) {
      controller.airport.value = airport;
      controller.name.text = airport.name!;
      controller.elevation.text = airport.elevation!.toString();
      controller.oaciCode.text = airport.oaciCode!;
      controller.iataCode.text = airport.iataCode!;
      controller.referenceTemperature.text = airport.referenceTemperature!.toString();
      controller.profileImage.value = airport.profileImage!;
    }
  }
}