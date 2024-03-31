// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:frontend_tfg/pages/edit_airport/edit_airport.controller.dart';
import 'package:get/get.dart';

class ViewAirportForm extends Container {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final EditAirportController controller = Get.put(EditAirportController());

  ViewAirportForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Obx(() => Column(
        children: [
          TextFormField(
            controller: TextEditingController(text: controller.airport.value.name),
            readOnly: true,
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
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: TextEditingController(text: controller.airport.value.elevation.toString()),
            readOnly: true,
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
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: TextEditingController(text: controller.airport.value.oaciCode),
            readOnly: true,
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
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: TextEditingController(text: controller.airport.value.iataCode),
            readOnly: true,
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
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: TextEditingController(text: controller.airport.value.referenceTemperature.toString()),
            readOnly: true,
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
          ),
          const SizedBox(height: 20),
        ],
      ))
    );
  }
}