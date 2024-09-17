
import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/airport_model.dart';
import 'package:frontend_tfg/data/services/airport.service.dart';
import 'package:frontend_tfg/pages/new_analysis/new_analysis.controller.dart';
import 'package:get/get.dart';

class AddAirportForm extends Container {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final NewAnalaysisController controller = Get.put(NewAnalaysisController());

  AddAirportForm({super.key});

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
            controller: controller.elevation,
            decoration: InputDecoration(
              labelText: 'elevation'.tr,
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
              suffixIcon: const Icon(Icons.numbers),
            ),
            validator: (value) => textValidator(value),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: controller.oaciCode,
            decoration: InputDecoration(
              labelText: 'oaciCode'.tr,
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
              suffixIcon: const Icon(Icons.code),
            ),
            validator: (value) => textValidator(value),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: controller.iataCode,
            decoration: InputDecoration(
              labelText: 'iataCode'.tr,
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
              suffixIcon: const Icon(Icons.code),
            ),
            validator: (value) => textValidator(value),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: controller.referenceTemperature,
            decoration: InputDecoration(
              labelText: 'referenceTemperature'.tr,
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
              suffixIcon: const Icon(Icons.thermostat),
            ),
            validator: (value) => textValidator(value),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                AirportModel airport = AirportModel(
                  name: controller.name.text,
                  elevation: double.parse(controller.elevation.text),
                  oaciCode: controller.oaciCode.text,
                  iataCode: controller.iataCode.text,
                  referenceTemperature: double.parse(controller.referenceTemperature.text)
                );

                AirportModel? airportAdded = await AirportService.addAirport(airport);
                if (airportAdded != null) {
                  controller.selectedAirport.value = airportAdded;
                  asignAirportData(controller);
                }
                if (!context.mounted) return;
                Navigator.of(context).pop();
              }
            },
            child: Text('addAirport'.tr,),
          ),
        ],
      )
    );
  }
}