import 'package:flutter/material.dart';
import 'package:frontend_tfg/general_widgets/custom_tab_bar.dart';
import 'package:frontend_tfg/pages/home/home.controller.dart';
import 'package:frontend_tfg/pages/home/widgets/procedure_card.dart';
import 'package:get/get.dart';

Widget desktopView(double height, TickerProviderStateMixin page) {
  TextEditingController searchController = TextEditingController();
  final HomeController controller = Get.put(HomeController());
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomTabBar(page: page, number: 0),
      const SizedBox(height: 20),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
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
                onSubmitted: (value) {

                },
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.procedures.length,
                    itemBuilder: (context, index) {
                      final procedure = controller.procedures[index];
                      return ProcedureCard(
                        airport: procedure['airport']['name'],
                        aircraft: procedure['aircraft']['name'],
                        sidName: procedure['sidName'],
                        rwyName: procedure['rwyName'],
                        dpName: procedure['dpName'],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
