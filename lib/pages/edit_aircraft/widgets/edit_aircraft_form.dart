
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
          const SizedBox(height: 40),
          ElevatedButton(onPressed: () async {
            if (_formKey.currentState!.validate()) {
              controller.aircraft.value.name = controller.name.text;
              controller.aircraft.value.metro = controller.metro.text;

              bool? success = await AircraftService.updateAircraft(
                context,
                controller.aircraft.value.id!,
                controller.aircraft.value
              );

              if (success != null || success == true) {
                ToastUtils.showSuccessToast(context, 'editAircraftSuccess'.tr);
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