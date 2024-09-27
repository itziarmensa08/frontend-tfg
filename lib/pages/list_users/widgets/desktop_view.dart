import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend_tfg/general_widgets/custom_tab_bar.dart';
import 'package:frontend_tfg/pages/list_users/list_users.controller.dart';
import 'package:frontend_tfg/pages/list_users/widgets/user_card.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';

Widget desktopView(double height, BuildContext context, TickerProviderStateMixin page) {
  final ListUsersController controller = Get.put(ListUsersController());
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if(tabs.length > 5)
      CustomTabBar(page: page, number: 5),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 30.0, bottom: 30.0),
        child: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),
            children: [
              TextSpan(
                text: 'admin'.tr,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.toNamed(Routes.admin);
                  },
              ),
              TextSpan(text: ' > ', style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),),
              TextSpan(
                style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),
                text: 'usersList'.tr,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {},
              )
            ],
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: List.generate(
                    controller.users.length,
                    (index) => UserCard(
                      user: controller.users[index],
                    ),
                  ),
                )),
              ],
            ),
          )
        ),
      ),
    ],
  );
}
