import 'package:flutter/material.dart';
import 'package:frontend_tfg/routes/app_pages.dart';
import 'package:get/get.dart';

class ContentView {
  ContentView({required this.tab, required this.onTabPressed});

  final CustomTab tab;
  final void Function() onTabPressed;
}

final List<ContentView> contentViews = [
  ContentView(
    tab: const CustomTab(title: 'Home'),
    onTabPressed: () {
      // Lógica para abrir la página de inicio
      Get.toNamed(Routes.initial);
    },
  ),
  ContentView(
    tab: const CustomTab(title: 'New Analysis'),
    onTabPressed: () {
      // Lógica para abrir la página "Acerca de"
      Get.toNamed(Routes.newAnalysis);
    },
  ),
  ContentView(
    tab: const CustomTab(title: 'Projects'),
    onTabPressed: () {
      // Lógica para abrir la página de proyectos
      print('Abrir página de Proyectos');
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
    double tabBarScaling = screenWidth > 1400 ? 0.21 : screenWidth > 1100 ? 0.3 : 0.4;
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
