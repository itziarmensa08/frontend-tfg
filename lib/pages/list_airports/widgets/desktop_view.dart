import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend_tfg/general_widgets/custom_tab_bar.dart';
import 'package:frontend_tfg/pages/list_airports/list_airports.controller.dart';
import 'package:frontend_tfg/pages/list_airports/widgets/airport_card.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';

Widget desktopView(double height, BuildContext context, TickerProviderStateMixin page) {
  TextEditingController searchController = TextEditingController();
  final ListAirportsController controller = Get.put(ListAirportsController());

  void searchAirports(String query) {
    if (query.isEmpty) {
      controller.filteredairports.value = controller.airports;
    } else {
      controller.filteredairports.value = controller.airports.where((airport) {
        final nameLower = airport.name!.toLowerCase();
        final queryLower = query.toLowerCase();
        return nameLower.contains(queryLower) ||
          airport.iataCode!.toLowerCase().contains(queryLower) ||
          airport.oaciCode!.toLowerCase().contains(queryLower);
      }).toList();
    }
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if(tabs.length > 5)
      CustomTabBar(page: page, number: 5),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 30.0, bottom: 30.0),
        child: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),
            children: [
              TextSpan(
                text: 'admin'.tr,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.toNamed(Routes.admin);
                  },
              ),
              TextSpan(text: ' > ', style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),),
              TextSpan(
                style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),
                text: 'airportsList'.tr,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {},
              )
            ],
          ),
        ),
      ),
      TextField(
        controller: searchController,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'Buscar...',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
        onChanged: (value) {
          searchAirports(value);
        },
      ),
      const SizedBox(height: 20),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: List.generate(
                    controller.filteredairports.length,
                    (index) => AirportCard(
                      airport: controller.filteredairports[index],
                    ),
                  ),
                )),
              ],
            ),
          )
        ),
      ),
    ],
  );
}
