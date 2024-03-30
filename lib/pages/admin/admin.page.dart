
import 'package:flutter/material.dart';
import 'package:frontend_tfg/general_widgets/custom_tab_bar.dart';
import 'package:frontend_tfg/pages/home/home.controller.dart';
import 'package:frontend_tfg/pages/admin/widgets/desktop_view.dart';
import 'package:frontend_tfg/pages/admin/widgets/mobile_view.dart';
import 'package:get/get.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  AdminPageState createState() => AdminPageState();
}

class AdminPageState extends State<AdminPage> with TickerProviderStateMixin{

  final controller = Get.put(HomeController());

  var scaffoldKey = GlobalKey<ScaffoldState>();

  late double screenHeight;
  late double screenWidth;
  late double topPadding;
  late double botomPadding;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    topPadding = screenHeight * 0.05;
    botomPadding = screenHeight * 0.01;
    return Scaffold(
      endDrawer: drawer(tabs.map((e) => ListTile(title:  Text(e.tab.title), onTap: e.onTabPressed)).toList()),
      key: scaffoldKey,
      body: Padding(
        padding: EdgeInsets.only(bottom: botomPadding, top: topPadding),
        child: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 715){
            return desktopView(screenHeight * 0.85, context, this);
          }else{
            return mobileView(screenWidth, scaffoldKey, context);
          }
        }),
      ),);
  }

}