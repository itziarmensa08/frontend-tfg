
import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/services/aircraft.service.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';
import 'package:frontend_tfg/pages/edit_aircraft/edit_aircraft.binding.dart';
import 'package:frontend_tfg/pages/edit_aircraft/edit_aircraft.controller.dart';
import 'package:get/get.dart';

class EditAircraftForm extends Container {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final EditAircraftController controller = Get.put(EditAircraftController());

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
              controller.aircraft.value.name = controller.name.text;
              controller.aircraft.value.metro = controller.metro.text;
              controller.aircraft.value.profile!.nMotors!.heightFirstSegment = double.parse(controller.altitude1stSegmentN.text);
              controller.aircraft.value.profile!.nMotors!.heightSecondSegment = double.parse(controller.altitude2ndSegmentN.text);
              controller.aircraft.value.profile!.failure!.heightFirstSegment = double.parse(controller.altitude1stSegmentFailure.text);
              controller.aircraft.value.profile!.failure!.heightSecondSegment = double.parse(controller.altitude2ndSegmentFailure.text);

              bool? success = await AircraftService.updateAircraft(
                controller.aircraft.value.id!,
                controller.aircraft.value
              );

              if (success != null || success == true) {
                ToastUtils.showSuccessToast('editAircraftSuccess'.tr);
                if (!context.mounted) return;
                Navigator.of(context).pop();
                EditAircraftBinding.updateAircraftData();
              }
            }
          }, child: Text('editAircraft'.tr)),
        ],
      )
    );
  }
}