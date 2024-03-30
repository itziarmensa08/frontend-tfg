import 'package:flutter/material.dart';
import 'package:frontend_tfg/general_widgets/custom_tab_bar.dart';

Widget desktopView(double height, SingleTickerProviderStateMixin page) {

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      CustomTabBar(page: page),
      SizedBox(
        height: height,
        child: Text(
          'New Analysis'
        ),
      )
    ],
  );
}