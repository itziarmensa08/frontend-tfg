
import 'package:flutter/material.dart';
import 'package:frontend_tfg/general_widgets/custom_tab_bar.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';
import 'package:frontend_tfg/pages/home/list_aircrafts/list_aircrafts.controller.dart';
import 'package:frontend_tfg/pages/home/list_aircrafts/widgets/desktop_view.dart';
import 'package:frontend_tfg/pages/home/list_aircrafts/widgets/mobile_view.dart';
import 'package:get/get.dart';

class ListAircraftsHomePage extends StatefulWidget {
  const ListAircraftsHomePage({super.key});

  @override
  ListAircraftsHomePageState createState() => ListAircraftsHomePageState();
}

class ListAircraftsHomePageState extends State<ListAircraftsHomePage> with TickerProviderStateMixin{

  final controller = Get.put(ListAircraftsHomeController());

  var scaffoldKey = GlobalKey<ScaffoldState>();

  late TabController tabController;
  late double screenHeight;
  late double screenWidth;
  late double topPadding;
  late double botomPadding;

  @override
  Widget build(BuildContext context) {
    ToastUtils.initFToast(context);
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    topPadding = screenHeight * 0.05;
    botomPadding = screenHeight * 0.01;
    return Scaffold(
      endDrawer: const CustomDrawer(),
      key: scaffoldKey,
      body: Padding(
        padding: EdgeInsets.only(bottom: botomPadding, top: topPadding),
        child: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 715){
            return desktopView(screenHeight * 0.85, this, context);
          }else{
            return mobileView(screenWidth, scaffoldKey, context);
          }
        }),
      ),);
  }

}