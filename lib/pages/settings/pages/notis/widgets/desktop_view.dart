import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend_tfg/general_widgets/custom_tab_bar.dart';
import 'package:frontend_tfg/pages/settings/pages/notis/notifications.controller.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';

Widget desktopView(double height, BuildContext context, TickerProviderStateMixin page) {
  final NotisController controller = Get.put(NotisController());
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomTabBar(page: page, number: 4),
      Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 30.0),
        child: RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),
              children: [
                TextSpan(
                  text: 'settings'.tr,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.toNamed(Routes.settings);
                    },
                ),
                TextSpan(
                  text: ' > ',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),
                ),
                TextSpan(
                  text: 'notifications'.tr,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {},
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),
                ),
              ],
            ),
          )
      ),
      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('wantNotis'.tr),
              const SizedBox(height: 20),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Enable Notifications'.tr),
                    Obx(
                      () => Switch(
                        value: controller.notificationsEnabled.value,
                        onChanged: (bool value) {
                          controller.toggleNotifications(value);
                        },
                      ),
                    ),
                  ],
                ),
            ]
          )
        ),
      ),
    ],
  );
}