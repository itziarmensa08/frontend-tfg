// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/services/airport.service.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';
import 'package:frontend_tfg/pages/edit_airport/edit_airport.binding.dart';
import 'package:frontend_tfg/pages/edit_airport/edit_airport.controller.dart';
import 'package:get/get.dart';

class EditAirportForm extends Container {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final EditAirportController controller = Get.put(EditAirportController());

  EditAirportForm({super.key});

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
              suffixIcon: const Icon(Icons.code),
            ),
            validator: (value) => textValidator(value),
          ),
          const SizedBox(height: 40),
          ElevatedButton(onPressed: () async {
            if (_formKey.currentState!.validate()) {
              controller.airport.value.name = controller.name.text;
              controller.airport.value.elevation = double.parse(controller.elevation.text);
              controller.airport.value.oaciCode = controller.oaciCode.text;
              controller.airport.value.iataCode = controller.iataCode.text;
              controller.airport.value.referenceTemperature = double.parse(controller.referenceTemperature.text);

              bool? success = await AirportService.updateAirport(
                context,
                controller.airport.value.id!,
                controller.airport.value
              );

              if (success != null || success == true) {
                ToastUtils.showSuccessToast(context, 'editAirportSuccess'.tr);
                Navigator.of(context).pop();
                EditAirportBinding.updateAirportData();
              }
            }
          }, child: Text('editAirport'.tr)),
        ],
      )
    );
  }
}