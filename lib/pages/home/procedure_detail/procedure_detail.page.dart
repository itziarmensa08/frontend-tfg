
import 'package:flutter/material.dart';
import 'package:frontend_tfg/general_widgets/custom_tab_bar.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';
import 'package:frontend_tfg/pages/home/procedure_detail/widgets/desktop_view.dart';
import 'package:frontend_tfg/pages/home/procedure_detail/widgets/mobile_view.dart';
import 'package:frontend_tfg/pages/home/procedure_detail/procedure_detail.controller.dart';
import 'package:get/get.dart';

class ProcedureDetailPage extends StatefulWidget {
  const ProcedureDetailPage({super.key});

  @override
  ProcedureDetailPageState createState() => ProcedureDetailPageState();
}

class ProcedureDetailPageState extends State<ProcedureDetailPage> with TickerProviderStateMixin{

  final controller = Get.put(ProcedureDetailController());

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