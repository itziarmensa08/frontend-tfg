import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestorePassController extends GetxController {

  final TextEditingController pass1 = TextEditingController();
  final TextEditingController pass2 = TextEditingController();
  final RxString userId = RxString('');

}