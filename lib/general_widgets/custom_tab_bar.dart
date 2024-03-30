// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/auth.model.dart';
import 'package:frontend_tfg/data/services/user.service.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ContentView {
  ContentView({required this.tab, required this.onTabPressed});

  final CustomTab tab;
  final void Function() onTabPressed;
}

class CustomTab extends StatelessWidget {
  const CustomTab({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        title,
        style: const TextStyle(fontSize: 17),
      ),
    );
  }
}

List<ContentView> tabs = [];


class CustomTabBar extends StatelessWidget {
  CustomTabBar({super.key, required this.page});

  late TabController controller;
  final SingleTickerProviderStateMixin page;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    //double tabBarScaling = screenWidth > 1400 ? 0.21 : screenWidth > 1100 ? 0.3 : 0.4;
    double tabBarScaling = 0.7;
    return FutureBuilder(
      future: defineAuth(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (!tabs.isNotEmpty) {
            buildTabBar();
            controller = TabController(length: tabs.length, vsync: page, initialIndex: 0);
          }
          return Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.05),
            child: SizedBox(
              width: screenWidth * tabBarScaling,
              child: TabBar(
                controller: controller,
                tabs: tabs.map((contentView) => contentView.tab).toList(),
                onTap: (index) => tabs[index].onTabPressed(),
              ),
            ),
          );
        } else {
          return const LinearProgressIndicator();
        }
      },
    );
  }
}

Future<void> defineAuth() async {
  final userService = UserService();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var isUserLoggedIn = await userService.getUserLogged();
  if (isUserLoggedIn == true) {
    Auth.id = prefs.getString('id');
    Auth.token = prefs.getString('token');
    Auth.language = prefs.getString('language');
    Auth.isAdmin = prefs.getBool('isAdmin')!;
    print(Auth.toJson());
  }
}

buildTabBar() {
  tabs = [
    ContentView(
      tab: CustomTab(title: 'home'.tr),
      onTabPressed: () {
        Get.toNamed(Routes.home);
      },
    ),
    ContentView(
      tab: CustomTab(title: 'newAnalisis'.tr),
      onTabPressed: () {
        Get.toNamed(Routes.newAnalysis);
      },
    ),
    ContentView(
      tab: CustomTab(title: 'tasks'.tr),
      onTabPressed: () {},
    ),
    ContentView(
      tab: CustomTab(title: 'profile'.tr),
      onTabPressed: () {
        Get.toNamed(Routes.profile);
      },
    ),
    if (Auth.isAdmin == true)
      ContentView(
        tab: CustomTab(title: 'admin'.tr),
        onTabPressed: () {},
      ),
    ContentView(
      tab: CustomTab(title: 'settings'.tr),
      onTabPressed: () {},
    ),
  ];
}
