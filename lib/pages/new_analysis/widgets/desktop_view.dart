import 'package:flutter/material.dart';
import 'package:frontend_tfg/general_widgets/custom_tab_bar.dart';

Widget desktopView(double height, TickerProviderStateMixin page) {

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      CustomTabBar(page: page, number: 1),
      SizedBox(
        height: height,
        child: Text(
          'New Analysis'
        ),
      )
    ],
  );
}