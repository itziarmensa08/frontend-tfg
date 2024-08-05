// utils.dart

import 'package:frontend_tfg/data/models/user.model.dart';

List<Event> getEventsForDay(DateTime day, List<Event> tasks) {
  return tasks.where((task) => isSameDay(task.date, day)).toList();
}

bool isSameDay(DateTime? date1, DateTime date2) {
  if (date1 == null) return false;
  return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
}
