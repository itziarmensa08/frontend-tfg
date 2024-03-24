import 'package:flutter/material.dart';
import 'package:frontend_tfg/general_widgets/custom_tab_bar.dart';

Widget desktopView(TabController controller, List<ContentView> tabs, double height) {

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      CustomTabBar(controller: controller, tabs: tabs),
      SizedBox(
        height: height,
        child: Text(
          'New Analysis'
        ),
      )
    ],
  );
}