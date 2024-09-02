
import 'package:frontend_tfg/data/models/aircraft_model.dart';
import 'package:frontend_tfg/data/services/aircraft.service.dart';
import 'package:frontend_tfg/pages/edit_aircraft/edit_aircraft.controller.dart';
import 'package:get/get.dart';

class EditAircraftBinding implements Bindings {
  @override
  Future<void> dependencies() async {

    updateAircraftData();

  }

  static Future<void> updateAircraftData() async {
    final controller = Get.put(EditAircraftController());

    final Map arguments = Get.arguments;
    final String aircraftId = arguments['id'];
    final AircraftModel? aircraft = await AircraftService.getAircraftById(aircraftId);
    if (aircraft != null) {
      controller.aircraft.value = aircraft;
      controller.name.text = aircraft.name!;
      controller.metro.text = aircraft.metro!;
      controller.profileImage.value = aircraft.profileImage!;
      controller.altitude1stSegmentN.text = aircraft.profile!.nMotors!.heightFirstSegment!.toString();
      controller.altitude2ndSegmentN.text = aircraft.profile!.nMotors!.heightSecondSegment!.toString();
      controller.altitude1stSegmentFailure.text = aircraft.profile!.failure!.heightFirstSegment!.toString();
      controller.altitude2ndSegmentFailure.text = aircraft.profile!.failure!.heightSecondSegment!.toString();
    }
  }
}