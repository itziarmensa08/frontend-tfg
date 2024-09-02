import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAircraftController extends GetxController {

  final TextEditingController name = TextEditingController();
  final TextEditingController metro = TextEditingController();
  final TextEditingController altitude1stSegmentN = TextEditingController();
  final TextEditingController altitude2ndSegmentN = TextEditingController();
  final TextEditingController altitude1stSegmentFailure = TextEditingController();
  final TextEditingController altitude2ndSegmentFailure = TextEditingController();

  final RxString profileImage = RxString('');

}