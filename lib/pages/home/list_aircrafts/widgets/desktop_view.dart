import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend_tfg/general_widgets/custom_tab_bar.dart';
import 'package:frontend_tfg/pages/home/list_aircrafts/list_aircrafts.controller.dart';
import 'package:frontend_tfg/pages/home/list_aircrafts/widgets/aircraft_card.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';

Widget desktopView(double height, TickerProviderStateMixin page, BuildContext context,) {
  final ListAircraftsHomeController controller = Get.put(ListAircraftsHomeController());

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomTabBar(page: page, number: 0),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 30.0),
        child: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),
            children: [
              TextSpan(
                text: 'airportsList'.tr,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.toNamed(Routes.home);
                  },
              ),
              TextSpan(text: ' > ', style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),),
              TextSpan(
                style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),
                text: controller.airport.value.name,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {},
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 20),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'aircraftsListProc'.tr,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).primaryColor),
                      ),
                      TextSpan(
                        text: controller.airport.value.name ?? '',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      TextSpan(
                        text: ':',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Flexible(
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
