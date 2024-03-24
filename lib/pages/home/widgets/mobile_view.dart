import 'package:flutter/material.dart';

Widget mobileView(double width, GlobalKey<ScaffoldState> scaffoldKey, BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05 ),
    child: SizedBox(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            iconSize: width * 0.08,
            onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
            icon: const Icon(Icons.menu_rounded),
            color: Theme.of(context).colorScheme.primary,
          )
        ],
      ),
    ),
  );
}

Widget drawer (List<Widget> tabs) {
  return Drawer(
    child: ListView(children: tabs),
  );
}