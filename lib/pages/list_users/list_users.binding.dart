
import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/user.model.dart';
import 'package:frontend_tfg/data/services/user.service.dart';
import 'package:frontend_tfg/pages/list_users/list_users.controller.dart';
import 'package:get/get.dart';

class ListUsersBinding implements Bindings {
  @override
  Future<void> dependencies() async {

    BuildContext context = Get.context!;
    final ListUsersController controller = Get.put(ListUsersController());

    List<UserModel>? users = await UserService.getUsers(context);

    if (users != null) {
      controller.users.value = users;
    }


  }
}