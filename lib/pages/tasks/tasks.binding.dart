

import 'package:flutter/foundation.dart';
import 'package:frontend_tfg/data/models/user.model.dart';
import 'package:frontend_tfg/data/services/user.service.dart';
import 'package:frontend_tfg/pages/tasks/tasks.controller.dart';
import 'package:frontend_tfg/pages/tasks/widgets/utils.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TasksBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    final controller = Get.put(TasksController());

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');
    String? profileImage = prefs.getString('profileImage');
    if (username != null) controller.username.value = username;
    if (profileImage != null) controller.profileImage.value = profileImage;
    
    String? userId = prefs.getString('id');
    if (userId != null) {
      controller.idUser.value = userId;
      UserModel? user = await UserService.getUserById(userId);
      if (user != null) {
        var tasks = user.tasks;
        if (tasks != null) {
          controller.tasks.value = tasks;
        }
      }
    }
    controller.selectedEvents.value = ValueNotifier(getEventsForDay(controller.selectedDay.value, controller.tasks));
  }
}