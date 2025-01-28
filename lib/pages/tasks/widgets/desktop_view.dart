import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/user.model.dart';
import 'package:frontend_tfg/data/services/user.service.dart';
import 'package:frontend_tfg/general_widgets/custom_tab_bar.dart';
import 'package:frontend_tfg/general_widgets/user_profile.dart';
import 'package:frontend_tfg/pages/tasks/tasks.controller.dart';
import 'package:frontend_tfg/pages/tasks/widgets/utils.dart' as custom_utils;
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

Widget desktopView(double height, BuildContext context, TickerProviderStateMixin page) {
  final TasksController controller = Get.put(TasksController());
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Obx(() => UserProfileWidget(
        username: controller.username.value,
        profileImageUrl: controller.profileImage.value.isNotEmpty ? controller.profileImage.value : null
      )),
      CustomTabBar(page: page, number: 2),
      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() => Column(
            children: [
              TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2200, 3, 14),
                focusedDay: controller.focusedDay.value,
                calendarFormat: controller.calendarFormat.value,
                selectedDayPredicate: (day) {
                  return custom_utils.isSameDay(controller.selectedDay.value, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  controller.selectedDay.value = selectedDay;
                  controller.focusedDay.value = focusedDay;
                  controller.selectedEvents.value = ValueNotifier(custom_utils.getEventsForDay(controller.selectedDay.value, controller.tasks));
                },
                onFormatChanged: (format) {
                  controller.calendarFormat.value = format;
                },
                onPageChanged: (focusedDay) {
                  controller.focusedDay.value = focusedDay;
                },
                startingDayOfWeek: StartingDayOfWeek.monday,
                calendarBuilders: CalendarBuilders(
                  markerBuilder: (context, day, events) {
                    final tasksForDay = custom_utils.getEventsForDay(day, controller.tasks);
                    if (tasksForDay.isNotEmpty) {
                      return Positioned(
                        top: 6,
                        right: 100,
                        child: _buildEventsMarker(),
                      );
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              Expanded(
                child: ValueListenableBuilder<List<Event>>(
                  valueListenable: controller.selectedEvents.value,
                  builder: (context, value, _) {
                    return ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        final event = value[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 4.0,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: ListTile(
                            onTap: () => print('${event.title}'),
                            title: Text(
                              event.title ?? '',
                              style: TextStyle(
                                decoration: event.isCompleted == true
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                event.isCompleted == true
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                                color: event.isCompleted == true
                                    ? Colors.green
                                    : null,
                              ),
                              onPressed: () async {
                                await UserService.completeTask(controller.idUser.value, event.id!);
                                UserModel? user = await UserService.getUserById(controller.idUser.value);
                                if (user != null) {
                                  var tasks = user.tasks;
                                  if (tasks != null) {
                                    controller.tasks.value = tasks;
                                  }
                                }
                                controller.selectedEvents.value = ValueNotifier(custom_utils.getEventsForDay(controller.selectedDay.value, controller.tasks));
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          )),
        ),
      ),
    ],
  );
}

Widget _buildEventsMarker() {
  return Container(
    width: 7.0,
    height: 7.0,
    decoration: const BoxDecoration(
      color: Colors.deepPurpleAccent,
      shape: BoxShape.circle,
    ),
  );
}
