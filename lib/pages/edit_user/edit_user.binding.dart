
import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/user.model.dart';
import 'package:frontend_tfg/data/services/user.service.dart';
import 'package:frontend_tfg/pages/edit_user/edit_user.controller.dart';
import 'package:get/get.dart';

class EditUserBinding implements Bindings {
  @override
  Future<void> dependencies() async {

    updateUserData();

  }

  static Future<void> updateUserData() async {
    BuildContext context = Get.context!;
    final controller = Get.put(EditUserController());

    final Map arguments = Get.arguments;
    final String userId = arguments['id'];
    final UserModel? user = await UserService.getUserById(context, userId);
    if (user != null) {
      controller.user.value = user;
      controller.name.text = user.name!;
      controller.surname.text = user.surname!;
      controller.username.text = user.username!;
      controller.email.text = user.email!;
      controller.role.text = user.role!;

      if (user.telephone != null) {
        controller.telephone.text = user.telephone.toString();
      } else {
        controller.telephone = TextEditingController();
      }

      if (user.dateBorn != null) {
        controller.dateborn.text = user.dateBorn.toString();
      } else {
        controller.dateborn = TextEditingController();
      }
    }
  }
}