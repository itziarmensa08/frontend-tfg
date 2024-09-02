import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/aircraft_model.dart';
import 'package:get/get.dart';

class EditAircraftController extends GetxController {

  final TextEditingController name = TextEditingController();
  final TextEditingController metro = TextEditingController();
  final TextEditingController altitude1stSegmentN = TextEditingController();
  final TextEditingController altitude2ndSegmentN = TextEditingController();
  final TextEditingController altitude1stSegmentFailure = TextEditingController();
  final TextEditingController altitude2ndSegmentFailure = TextEditingController();
  final Rx<String?> profileImage = Rx<String?>(null);

  final Rx<AircraftModel> aircraft = AircraftModel().obs;

}