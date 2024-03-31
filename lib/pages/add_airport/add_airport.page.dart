
import 'package:flutter/material.dart';
import 'package:frontend_tfg/general_widgets/custom_tab_bar.dart';
import 'package:frontend_tfg/pages/add_airport/widgets/desktop_view.dart';
import 'package:frontend_tfg/pages/add_airport/widgets/mobile_view.dart';

class AddAirportPage extends StatefulWidget {
  const AddAirportPage({super.key});

  @override
  AddAirportPageState createState() => AddAirportPageState();
}

class AddAirportPageState extends State<AddAirportPage> with TickerProviderStateMixin{

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
      endDrawer: const CustomDrawer(),
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