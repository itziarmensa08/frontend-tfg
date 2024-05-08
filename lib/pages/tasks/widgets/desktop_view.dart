
import 'package:flutter/material.dart';
import 'package:frontend_tfg/general_widgets/custom_tab_bar.dart';
import 'package:frontend_tfg/pages/tasks/tasks.controller.dart';
import 'package:frontend_tfg/pages/tasks/widgets/utils.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

Widget desktopView(double height, BuildContext context, TickerProviderStateMixin page) {
  final TasksController controller = Get.put(TasksController());
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomTabBar(page: page, number: 2),
      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx (() => Column(
            children: [
              TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: controller.focusedDay.value,
                calendarFormat: controller.calendarFormat.value,
                selectedDayPredicate: (day) {
                  return isSameDay(controller.selectedDay.value, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  controller.selectedDay.value = selectedDay;
                  controller.focusedDay.value = focusedDay;
                },
                onFormatChanged: (format) {
                  controller.calendarFormat.value = format;
                },
                onPageChanged: (focusedDay) {
                  controller.focusedDay.value = focusedDay;
                },
                startingDayOfWeek: StartingDayOfWeek.monday,
              ),
              const SizedBox(height: 20.0),
              Expanded(
                child: ValueListenableBuilder<List<Event>>(
                  valueListenable: controller.selectedEvents.value,
                  builder: (context, value, _) {
                    return ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (context, index) {
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
                            onTap: () => print('${value[index]}'),
                            title: Text('${value[index]}'),
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
