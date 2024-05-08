

import 'package:flutter/foundation.dart';
import 'package:frontend_tfg/pages/tasks/tasks.controller.dart';
import 'package:frontend_tfg/pages/tasks/widgets/utils.dart';
import 'package:get/get.dart';

class TasksBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    final controller = Get.put(TasksController());
    controller.selectedEvents.value = ValueNotifier(getEventsForDay(controller.selectedDay.value));
  }

  List<Event> getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }
}