// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:frontend_tfg/pages/edit_aircraft/edit_aircraft.controller.dart';
import 'package:get/get.dart';

class ViewAircraftForm extends Container {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final EditAircraftController controller = Get.put(EditAircraftController());

  ViewAircraftForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Obx(() => Column(
        children: [
          TextFormField(
            controller: TextEditingController(text: controller.aircraft.value.metro),
            readOnly: true,
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
          ),
          const SizedBox(height: 20),
          if (controller.aircraft.value.profile != null)
          TextFormField(
            controller: TextEditingController(text: controller.aircraft.value.profile!.nMotors!.heightFirstSegment!.toString()),
            readOnly: true,
            decoration: InputDecoration(
              labelText: 'altitude1stSegmentN'.tr,
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
          if (controller.aircraft.value.profile != null)
          TextFormField(
            controller: TextEditingController(text: controller.aircraft.value.profile!.nMotors!.heightSecondSegment!.toString()),
            readOnly: true,
            decoration: InputDecoration(
              labelText: 'altitude2ndSegmentN'.tr,
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
          if (controller.aircraft.value.profile != null)
          TextFormField(
            controller: TextEditingController(text: controller.aircraft.value.profile!.failure!.heightFirstSegment!.toString()),
            readOnly: true,
            decoration: InputDecoration(
              labelText: 'altitude1stSegmentFailure'.tr,
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
          if (controller.aircraft.value.profile != null)
          TextFormField(
            controller: TextEditingController(text: controller.aircraft.value.profile!.failure!.heightSecondSegment!.toString()),
            readOnly: true,
            decoration: InputDecoration(
              labelText: 'altitude2ndSegmentFailure'.tr,
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
        ],
      ))
    );
  }
}