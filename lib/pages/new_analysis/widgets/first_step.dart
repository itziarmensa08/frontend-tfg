import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend_tfg/data/models/aircraft_model.dart';
import 'package:frontend_tfg/data/models/airport_model.dart';
import 'package:frontend_tfg/pages/edit_airport/widgets/view_airport_form.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/add_airport_form.dart';
import 'package:frontend_tfg/pages/new_analysis/new_analysis.controller.dart';
import 'package:get/get.dart';

class FirstStep extends StatelessWidget {
  const FirstStep({Key? key, required this.controller}) : super(key: key);

  final NewAnalaysisController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('selectAirport'.tr, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: 20),
            Expanded(
              child: Autocomplete<AirportModel>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  return controller.airports.where((AirportModel airport) {
                    return airport.name!.toLowerCase().contains(textEditingValue.text.toLowerCase()) ||
                          airport.oaciCode!.toLowerCase().contains(textEditingValue.text.toLowerCase()) ||
                          airport.iataCode!.toLowerCase().contains(textEditingValue.text.toLowerCase());
                  }).toList();
                },
                onSelected: (AirportModel? newValue) {
                  if (newValue != null) {
                    controller.selectedAirport.value = newValue;
                  }
                },
                displayStringForOption: (AirportModel option) => option.name ?? '',
                fieldViewBuilder: (BuildContext context, TextEditingController fieldTextEditingController, FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
                  return Obx(() => TextFormField(
                    controller: fieldTextEditingController,
                    focusNode: fieldFocusNode,
                    decoration: InputDecoration(
                      hintText: controller.selectedAirport.value == null ? 'searchAirport'.tr : controller.selectedAirport.value?.name,
                      hintStyle: Theme.of(context).textTheme.titleMedium,
                      border: const OutlineInputBorder(),
                    ),
                  ));
                },
              ),
            ),
            const SizedBox(width: 20),
            Text('selectAircraft'.tr, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: 20),
            Expanded(
              child: Autocomplete<AircraftModel>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  return controller.aircrafts.where((AircraftModel aircraft) {
                    return aircraft.name!.toLowerCase().contains(textEditingValue.text.toLowerCase()) ||
                          aircraft.metro!.toLowerCase().contains(textEditingValue.text.toLowerCase());
                  }).toList();
                },
                onSelected: (AircraftModel? newValue) {
                  if (newValue != null) {
                    controller.selectedAircraft.value = newValue;
                  }
                },
                displayStringForOption: (AircraftModel option) => option.name ?? '',
                fieldViewBuilder: (BuildContext context, TextEditingController fieldTextEditingController, FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
                  return TextFormField(
                    controller: fieldTextEditingController,
                    focusNode: fieldFocusNode,
                    decoration: InputDecoration(
                      hintText: 'searchAircraft'.tr,
                      hintStyle: Theme.of(context).textTheme.titleMedium,
                      border: const OutlineInputBorder(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Text('notAirport'.tr, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: 5),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Column(
                          children: [
                            const SizedBox(height: 30),
                            const CircleAvatar(
                              radius: 50.0,
                              child: Icon(Icons.connecting_airports, size: 70.0),
                            ),
                            const SizedBox(height: 40),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: AddAirportForm()
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  'here'.tr,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.blue)
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Obx(() => Visibility(
          visible: controller.selectedAirport.value != null,
          child: Column(
            children: [
              Row(
                children: [
                  Text('Son correctos los datos del aeropuerto?', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(width: 20),
                  ElevatedButton(onPressed: () {}, child: Text('Si')),
                  const SizedBox(width: 20),
                  ElevatedButton(onPressed: () {}, child: Text('No'))
                ],
              ),
              const SizedBox(height: 20),
              ViewAirportForm()
            ],
          )
        ))
      ],
    );
  }
}
