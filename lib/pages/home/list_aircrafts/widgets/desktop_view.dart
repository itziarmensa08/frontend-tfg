import 'package:flutter/material.dart';
import 'package:frontend_tfg/general_widgets/custom_tab_bar.dart';
import 'package:frontend_tfg/pages/home/list_aircrafts/list_aircrafts.controller.dart';
import 'package:frontend_tfg/pages/home/list_aircrafts/widgets/aircraft_card.dart';
import 'package:get/get.dart';

Widget desktopView(double height, TickerProviderStateMixin page, BuildContext context,) {
  final ListAircraftsHomeController controller = Get.put(ListAircraftsHomeController());

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomTabBar(page: page, number: 0),
      const SizedBox(height: 20),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  '${'aircraftsListProc'.tr}${controller.airport.value.name ?? ''}:',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).primaryColor),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.aircrafts.length,
                    itemBuilder: (context, index) {
                      final aircraft = controller.aircrafts[index];
                      return AircraftCardHome(aircraft: aircraft);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
