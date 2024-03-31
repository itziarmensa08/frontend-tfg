import 'package:flutter/material.dart';
import 'package:frontend_tfg/pages/admin/widgets/dashboard_card.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';

Widget mobileView(double width, GlobalKey<ScaffoldState> scaffoldKey, BuildContext context) {
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Card(
                    color: Colors.white,
                    shadowColor: Colors.white,
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'users'.tr,
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).primaryColor),
                          ),
                          const SizedBox(height: 10),
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
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Card(
                    color: Colors.white,
                    shadowColor: Colors.white,
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'aircrafts'.tr,
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).primaryColor),
                          ),
                          const SizedBox(height: 10),
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
                              Get.toNamed(Routes.listAircrafts);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Card(
                    color: Colors.white,
                    shadowColor: Colors.white,
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'airports'.tr,
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).primaryColor),
                          ),
                          const SizedBox(height: 10),
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
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

