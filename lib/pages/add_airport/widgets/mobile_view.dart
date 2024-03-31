import 'package:flutter/material.dart';
import 'package:frontend_tfg/pages/add_airport/widgets/add_airport_form.dart';

Widget mobileView(double width, GlobalKey<ScaffoldState> scaffoldKey, BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05 ),
    child: SizedBox(
      width: width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  iconSize: width * 0.08,
                  onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
                  icon: const Icon(Icons.menu_rounded),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                const SizedBox(height: 30),
                const CircleAvatar(
                  radius: 50.0,
                  child: Icon(Icons.connecting_airports, size: 70.0),
                ),
                const SizedBox(height: 40),
                AddAirportForm(),
                const SizedBox(height: 40),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

