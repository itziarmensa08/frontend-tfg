import 'package:flutter/material.dart';
import 'package:frontend_tfg/general_widgets/custom_tab_bar.dart';
import 'package:frontend_tfg/pages/admin/widgets/dashboard_card.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';

Widget desktopView(double height, BuildContext context, TickerProviderStateMixin page) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomTabBar(page: page, number: 4),
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
                    color: Colors.white,
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
                    color: Colors.white,
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
                                color: Color(0xFFF3720A),
                                onTap: () {},
                              ),
                              DashboardCard(
                                title: 'addAircraftTitle'.tr,
                                icon: Icons.add_circle_outline_outlined,
                                color: Color(0xFFF3720A),
                                onTap: () {},
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
                    color: Colors.white,
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
                                color: Color.fromARGB(255, 180, 179, 179),
                                onTap: () {},
                              ),
                              DashboardCard(
                                title: 'addAirportTitle'.tr,
                                icon: Icons.add_home_work_outlined,
                                color: Color.fromARGB(255, 180, 179, 179),
                                onTap: () {},
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
