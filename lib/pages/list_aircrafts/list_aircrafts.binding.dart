
import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/aircraft_model.dart';
import 'package:frontend_tfg/data/services/aircraft.service.dart';
import 'package:frontend_tfg/pages/list_aircrafts/list_aircrafts.controller.dart';
import 'package:get/get.dart';

class ListAircraftsBinding implements Bindings {
  @override
  Future<void> dependencies() async {

    BuildContext context = Get.context!;
    final ListAircraftsController controller = Get.put(ListAircraftsController());

    List<AircraftModel>? aircrafts = await AircraftService.getAircrafts(context);

    if (aircrafts != null) {
      controller.aircrafts.value = aircrafts;
    }


  }
}