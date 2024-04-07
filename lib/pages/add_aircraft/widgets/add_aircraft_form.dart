// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/aircraft_model.dart';
import 'package:frontend_tfg/data/services/aircraft.service.dart';
import 'package:frontend_tfg/pages/add_aircraft/add_aircraft.controller.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';

class AddAircraftForm extends Container {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AddAircraftController controller = Get.put(AddAircraftController());

  AddAircraftForm({super.key});

  String? textValidator (String? value) {
    if (value == null || value.isEmpty) {
      return 'enterText'.tr;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: controller.name,
            decoration: InputDecoration(
              labelText: 'name'.tr,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              suffixIcon: const Icon(Icons.airplanemode_active),
            ),
            validator: (value) => textValidator(value),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: controller.metro,
            decoration: InputDecoration(
              labelText: 'Metro',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              suffixIcon: const Icon(Icons.airplanemode_active),
            ),
            validator: (value) => textValidator(value),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                AircraftModel aircraft = AircraftModel(
                  name: controller.name.text,
                  metro: controller.metro.text
                );

                await AircraftService.addAircraft(aircraft);
                controller.name.clear();
                controller.metro.clear();
                Get.toNamed(Routes.admin);
              }
            },
            child: Text('addAircraft'.tr),
          ),
        ],
      )
    );
  }
}