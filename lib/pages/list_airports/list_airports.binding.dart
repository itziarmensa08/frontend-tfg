
import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/airport_model.dart';
import 'package:frontend_tfg/data/services/airport.service.dart';
import 'package:frontend_tfg/pages/list_airports/list_airports.controller.dart';
import 'package:get/get.dart';

class ListAirportsBinding implements Bindings {
  @override
  Future<void> dependencies() async {

    BuildContext context = Get.context!;
    final ListAirportsController controller = Get.put(ListAirportsController());

    List<AirportModel>? airports = await AirportService.getAirports(context);

    if (airports != null) {
      controller.airports.value = airports;
    }


  }
}