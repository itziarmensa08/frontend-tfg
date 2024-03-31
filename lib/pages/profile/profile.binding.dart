
import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/auth.model.dart';
import 'package:frontend_tfg/data/services/user.service.dart';
import 'package:frontend_tfg/pages/profile/profile.controller.dart';
import 'package:get/get.dart';

class ProfileBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    updateUserData();
  }

  static Future<void> updateUserData() async {
    BuildContext context = Get.context!;
    final controller = Get.put(ProfileController());
    var idUser = Auth.id;
    if (idUser != null) {
      var user = await UserService.getUserById(context, idUser);
      if (user != null) {
        controller.user.value = user;
        controller.name.text = user.name!;
        controller.surname.text = user.surname!;
        controller.username.text = user.username!;
        controller.email.text = user.email!;
        controller.role.text = user.role!;
        controller.profileImage.value = user.profileImage!;

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

}