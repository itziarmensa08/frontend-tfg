

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

List<ContentView> tabs = [
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
      Get.toNamed(Routes.tasks);
    },
  ),
  ContentView(
    tab: CustomTab(title: 'profile'.tr),
    onTabPressed: () {
      Get.toNamed(Routes.profile);
    },
  ),
  ContentView(
    tab: CustomTab(title: 'settings'.tr),
    onTabPressed: () {},
  ),
];


class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key, required this.number, required this.page});

  final int number;
  final TickerProviderStateMixin page;

  @override
  CustomTabBarState createState() => CustomTabBarState();
}

class CustomTabBarState extends State<CustomTabBar> {

  late TabController controller = TabController(length: tabs.length, vsync: widget.page, initialIndex: widget.number);
  late bool authCompleted = false;

  @override
  void initState() {
    super.initState();
    defineAuth();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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

  Future<void> defineAuth() async {
    final userService = UserService();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var isUserLoggedIn = await userService.getUserLogged();
    if (isUserLoggedIn == true) {
      Auth.id = prefs.getString('id');
      Auth.token = prefs.getString('token');
      Auth.language = prefs.getString('language');
      Auth.isAdmin = prefs.getBool('isAdmin')!;
    }
    setState(() {
      buildTabBar();
      authCompleted = true;
      controller = TabController(length: tabs.length, vsync: widget.page, initialIndex: widget.number);
    });
  }
}

void buildTabBar() {
  bool isAdminTabExists = tabs.any((contentView) => contentView.tab.title == 'admin'.tr);

  if (Auth.isAdmin == true && !isAdminTabExists) {
    tabs.add(
      ContentView(
        tab: CustomTab(title: 'admin'.tr),
        onTabPressed: () {
          Get.toNamed(Routes.admin);
        },
      ),
    );
  }
}


class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  CustomDrawerState createState() => CustomDrawerState();
}

class CustomDrawerState extends State<CustomDrawer> {
  late bool authCompleted = false;

  @override
  void initState() {
    super.initState();
    defineAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: tabs.map((contentView) => ListTile(
          title: Text(contentView.tab.title),
          onTap: () {
            contentView.onTabPressed();
          },
        )).toList(),
      ),
    );
  }

  void defineAuth() async {
    final userService = UserService();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var isUserLoggedIn = await userService.getUserLogged();
    if (isUserLoggedIn == true) {
      Auth.id = prefs.getString('id');
      Auth.token = prefs.getString('token');
      Auth.language = prefs.getString('language');
      Auth.isAdmin = prefs.getBool('isAdmin')!;
    }
    setState(() {
      buildTabBar();
      authCompleted = true;
    });
  }
}
