

import 'package:flutter/foundation.dart';
import 'package:frontend_tfg/data/models/user.model.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class TasksController extends GetxController {
  Rx<DateTime> focusedDay = Rx<DateTime>(DateTime.now());
  RxString idUser = RxString('');
  Rx<CalendarFormat> calendarFormat = Rx<CalendarFormat>(CalendarFormat.month);
  Rx<DateTime> selectedDay = Rx<DateTime>(DateTime.now());
  Rx<ValueNotifier<List<Event>>> selectedEvents = Rx<ValueNotifier<List<Event>>>(ValueNotifier<List<Event>>([]));
  var tasks = <Event>[].obs;
}