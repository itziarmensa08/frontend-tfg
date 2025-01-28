import 'package:flutter/material.dart';
import 'package:frontend_tfg/general_widgets/custom_tab_bar.dart';
import 'package:frontend_tfg/general_widgets/user_profile.dart';
import 'package:frontend_tfg/pages/home/home.controller.dart';
import 'package:frontend_tfg/pages/home/widgets/airport_card.dart';
import 'package:get/get.dart';

Widget desktopView(double height, TickerProviderStateMixin page, BuildContext context,) {
  TextEditingController searchController = TextEditingController();
  final HomeController controller = Get.put(HomeController());

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
      Obx(() => UserProfileWidget(
        username: controller.username.value,
        profileImageUrl: controller.profileImage.value.isNotEmpty ? controller.profileImage.value : null
      )),
      CustomTabBar(page: page, number: 0),
      const SizedBox(height: 20),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'airportsListProc'.tr,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).primaryColor),
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
                            (index) => AirportCardHome(
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
          ),
        ),
      ),
    ],
  );
}
