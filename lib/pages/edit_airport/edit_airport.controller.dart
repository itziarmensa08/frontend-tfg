import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/airport_model.dart';
import 'package:get/get.dart';

class EditAirportController extends GetxController {

  final Rx<String?> profileImage = Rx<String?>(null);

  final TextEditingController name = TextEditingController();
  final TextEditingController elevation = TextEditingController();
  final TextEditingController oaciCode = TextEditingController();
  final TextEditingController iataCode = TextEditingController();
  final TextEditingController referenceTemperature = TextEditingController();

  final Rx<AirportModel> airport = AirportModel().obs;

}