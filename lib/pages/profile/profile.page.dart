
import 'package:flutter/material.dart';
import 'package:frontend_tfg/general_widgets/custom_tab_bar.dart';
import 'package:frontend_tfg/pages/profile/widgets/desktop_view.dart';
import 'package:frontend_tfg/pages/profile/widgets/mobile_view.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<ProfilePage> with SingleTickerProviderStateMixin{

  var scaffoldKey = GlobalKey<ScaffoldState>();

  late TabController tabController;
  late double screenHeight;
  late double screenWidth;
  late double topPadding;
  late double botomPadding;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: contentViews.length, vsync: this, initialIndex: 3);
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    topPadding = screenHeight * 0.05;
    botomPadding = screenHeight * 0.01;
    return Scaffold(
      endDrawer: drawer(contentViews.map((e) => ListTile(title:  Text(e.tab.title), onTap: e.onTabPressed)).toList()),
      key: scaffoldKey,
      body: Padding(
        padding: EdgeInsets.only(bottom: botomPadding, top: topPadding),
        child: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 715){
            return desktopView(tabController, contentViews, screenHeight * 0.85, context);
          }else{
            return mobileView(screenWidth, scaffoldKey, context);
          }
        }),
      ),);
  }

}