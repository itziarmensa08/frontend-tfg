import 'package:flutter/material.dart';
import 'package:frontend_tfg/general_widgets/custom_tab_bar.dart';
import 'package:frontend_tfg/general_widgets/user_profile.dart';
import 'package:frontend_tfg/pages/admin/admin.controller.dart';
import 'package:frontend_tfg/pages/admin/widgets/dashboard_card.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';

Widget desktopView(double height, BuildContext context, TickerProviderStateMixin page) {
  final AdminController controller = Get.put(AdminController());
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Obx(() => UserProfileWidget(
        username: controller.username.value,
        profileImageUrl: controller.profileImage.value.isNotEmpty ? controller.profileImage.value : null
      )),
      if(tabs.length > 5)
      CustomTabBar(page: page, number: 5),
      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              alignment: WrapAlignment.center,
              spacing: 30,
              runSpacing: 30,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Card(
                    color: const Color.fromRGBO(230, 238, 246, 1),
                    shadowColor: Colors.white,
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'users'.tr,
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).primaryColor),
                          ),
                          const SizedBox(height: 20),
                          Wrap(
                            spacing: 30,
                            runAlignment: WrapAlignment.center,
                            alignment: WrapAlignment.center,
                            children: [
                              DashboardCard(
                                title: 'usersTitle'.tr,
                                icon: Icons.people,
                                color: Theme.of(context).primaryColor,
                                onTap: () {
                                  Get.toNamed(Routes.listUsers);
                                },
                              ),
                              DashboardCard(
                                title: 'addUserTitle'.tr,
                                icon: Icons.person_add,
                                color: Theme.of(context).primaryColor,
                                onTap: () {
                                  Get.toNamed(Routes.addUser);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Card(
                    color: const Color.fromRGBO(230, 238, 246, 1),
                    shadowColor: Colors.white,
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'aircrafts'.tr,
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).primaryColor),
                          ),
                          const SizedBox(height: 20),
                          Wrap(
                            spacing: 30,
                            runAlignment: WrapAlignment.center,
                            alignment: WrapAlignment.center,
                            children: [
                              DashboardCard(
                                title: 'aircraftsTitle'.tr,
                                icon: Icons.airplanemode_active,
                                color: const Color(0xFFF3720A),
                                onTap: () {
                                  Get.toNamed(Routes.listAircrafts);
                                },
                              ),
                              DashboardCard(
                                title: 'addAircraftTitle'.tr,
                                icon: Icons.add_circle_outline_outlined,
                                color: const Color(0xFFF3720A),
                                onTap: () {
                                  Get.toNamed(Routes.addAircraft);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Card(
                    color: const Color.fromRGBO(230, 238, 246, 1),
                    shadowColor: Colors.white,
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'airports'.tr,
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).primaryColor),
                          ),
                          const SizedBox(height: 20),
                          Wrap(
                            spacing: 30,
                            runAlignment: WrapAlignment.center,
                            alignment: WrapAlignment.center,
                            children: [
                              DashboardCard(
                                title: 'airportsTitle'.tr,
                                icon: Icons.connecting_airports,
                                color: const Color.fromARGB(255, 180, 179, 179),
                                onTap: () {
                                  Get.toNamed(Routes.listAirports);
                                },
                              ),
                              DashboardCard(
                                title: 'addAirportTitle'.tr,
                                icon: Icons.add_home_work_outlined,
                                color: const Color.fromARGB(255, 180, 179, 179),
                                onTap: () {
                                  Get.toNamed(Routes.addAirport);
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
