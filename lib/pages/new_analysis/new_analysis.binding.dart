
import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/aircraft_model.dart';
import 'package:frontend_tfg/data/models/airport_model.dart';
import 'package:frontend_tfg/data/services/aircraft.service.dart';
import 'package:frontend_tfg/data/services/airport.service.dart';
import 'package:frontend_tfg/pages/new_analysis/new_analysis.controller.dart';
import 'package:get/get.dart';

class NewAnalysisBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    BuildContext context = Get.context!;
    final NewAnalaysisController controller = Get.put(NewAnalaysisController());

    List<AircraftModel>? aircrafts = await AircraftService.getAircrafts(context);

    if (aircrafts != null) {
      controller.aircrafts.value = aircrafts;
    }

    List<AirportModel>? airports = await AirportService.getAirports(context);

    if (airports != null) {
      controller.airports.value = airports;
    }
  }
}