import 'package:flutter/material.dart';
import 'package:frontend_tfg/general_widgets/custom_tab_bar.dart';
import 'package:frontend_tfg/pages/list_users/list_users.controller.dart';
import 'package:frontend_tfg/pages/list_users/widgets/user_card.dart';
import 'package:get/get.dart';

Widget desktopView(double height, BuildContext context, TickerProviderStateMixin page) {
  final ListUsersController controller = Get.put(ListUsersController());
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomTabBar(page: page, number: 4),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'usersList'.tr,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).primaryColor),
                  ),
                ),
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
