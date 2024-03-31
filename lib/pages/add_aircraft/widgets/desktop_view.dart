import 'package:flutter/material.dart';
import 'package:frontend_tfg/general_widgets/custom_tab_bar.dart';
import 'package:frontend_tfg/pages/add_aircraft/widgets/add_aircraft_form.dart';

Widget desktopView(double height, BuildContext context, TickerProviderStateMixin page) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if(tabs.length > 5)
      CustomTabBar(page: page, number: 5),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    const CircleAvatar(
                      radius: 50.0,
                      child: Icon(Icons.airplanemode_active, size: 70.0),
                    ),
                    const SizedBox(height: 40),
                    AddAircraftForm(),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          )
        ),
      ),
    ],
  );
}
