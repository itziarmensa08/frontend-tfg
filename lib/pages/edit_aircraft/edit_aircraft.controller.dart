import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/aircraft_model.dart';
import 'package:get/get.dart';

class EditAircraftController extends GetxController {

  final TextEditingController name = TextEditingController();
  final TextEditingController metro = TextEditingController();
  final Rx<String?> profileImage = Rx<String?>(null);

  final Rx<AircraftModel> aircraft = AircraftModel().obs;

}