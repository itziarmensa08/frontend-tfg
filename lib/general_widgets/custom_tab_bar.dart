import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/auth.model.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';
class ContentView {
  ContentView({required this.tab, required this.onTabPressed});

  final CustomTab tab;
  final void Function() onTabPressed;
}

final List<ContentView> contentViews = [
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
    onTabPressed: () {

    },
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
    onTabPressed: () {

    },
  ),
  ContentView(
    tab: CustomTab(title: 'settings'.tr),
    onTabPressed: () {

    },
  ),
];

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

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key, required this.controller, required this.tabs});

  final TabController controller;
  final List<ContentView> tabs;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    //double tabBarScaling = screenWidth > 1400 ? 0.21 : screenWidth > 1100 ? 0.3 : 0.4;
    double tabBarScaling = 0.7;
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
  }
}
