import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/user.model.dart';
import 'package:get/get.dart';

class EditUserController extends GetxController {

  final Rx<UserModel> user = UserModel().obs;

  final TextEditingController name = TextEditingController();
  final TextEditingController surname = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  TextEditingController telephone = TextEditingController();
  TextEditingController dateborn = TextEditingController();
  TextEditingController role = TextEditingController();

  DateTime? date;

}