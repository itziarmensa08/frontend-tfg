
import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/services/aircraft.service.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';
import 'package:frontend_tfg/pages/new_analysis/new_analysis.controller.dart';
import 'package:get/get.dart';

class EditAircraftForm extends Container {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final NewAnalaysisController controller = Get.put(NewAnalaysisController());

  EditAircraftForm({super.key});

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
            controller: controller.nameAircraft,
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
          const SizedBox(height: 20),
          TextFormField(
            controller: controller.altitude1stSegmentN,
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
            validator: (value) => textValidator(value),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: controller.altitude2ndSegmentN,
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
            validator: (value) => textValidator(value),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: controller.altitude1stSegmentFailure,
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
            validator: (value) => textValidator(value),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: controller.altitude2ndSegmentFailure,
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
            validator: (value) => textValidator(value),
          ),
          const SizedBox(height: 40),
          ElevatedButton(onPressed: () async {
            if (_formKey.currentState!.validate()) {
              controller.selectedAircraft.value!.name = controller.nameAircraft.text;
              controller.selectedAircraft.value!.metro = controller.metro.text;
              controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment = double.parse(controller.altitude1stSegmentN.text);
              controller.selectedAircraft.value!.profile!.nMotors!.heightSecondSegment = double.parse(controller.altitude2ndSegmentN.text);
              controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment = double.parse(controller.altitude1stSegmentFailure.text);
              controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment = double.parse(controller.altitude2ndSegmentFailure.text);

              bool? success = await AircraftService.updateAircraft(
                controller.selectedAircraft.value!.id!,
                controller.selectedAircraft.value!
              );

              if (success != null || success == true) {
                ToastUtils.showSuccessToast('editAircraftSuccess'.tr);
                if (!context.mounted) return;
                Navigator.of(context).pop();
                asignAircraftData(controller);
              }
            }
          }, child: Text('editAircraft'.tr)),
        ],
      )
    );
  }
}