import 'package:flutter/material.dart';
import 'package:frontend_tfg/pages/list_users/list_users.controller.dart';
import 'package:frontend_tfg/pages/list_users/widgets/user_card.dart';
import 'package:get/get.dart';

Widget mobileView(double width, GlobalKey<ScaffoldState> scaffoldKey, BuildContext context) {
  final ListUsersController controller = Get.put(ListUsersController());
  return Padding(
    padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05 ),
    child: SizedBox(
      width: width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  iconSize: width * 0.08,
                  onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
                  icon: const Icon(Icons.menu_rounded),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
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
          ],
        ),
      ),
    ),
  );
}


Widget drawer (List<Widget> tabs) {
  return Drawer(
    child: ListView(children: tabs),
  );
}

