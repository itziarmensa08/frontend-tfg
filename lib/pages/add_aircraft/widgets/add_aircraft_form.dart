// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/aircraft_model.dart';
import 'package:frontend_tfg/data/services/aircraft.service.dart';
import 'package:frontend_tfg/data/services/cloudinary.service.dart';
import 'package:frontend_tfg/general_widgets/toast.dart';
import 'package:frontend_tfg/pages/add_aircraft/add_aircraft.controller.dart';
import 'package:frontend_tfg/routes/app.pages.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              final file = await ImagePicker().pickImage(source: ImageSource.gallery);
              final imagesSingleton = ImagesSingleton.getInstance();
              final secureUrl = await imagesSingleton.uploadPhoto(
                file!,
                'aircrafts',
                controller.metro.text,
              );
              if (secureUrl != null) {
                controller.profileImage.value = secureUrl;
              } else {
                ToastUtils.showErrorToast('errorCloudinary'.tr);
              }
            },
            child: Text('subirProfile'.tr),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                var nMotorsProfile = NMotorsProfile(
                  heightFirstSegment: double.parse(controller.altitude1stSegmentN.text),
                  heightSecondSegment: double.parse(controller.altitude2ndSegmentN.text)
                );
                var failureProfile = FailureProfile(
                  heightFirstSegment: double.parse(controller.altitude1stSegmentFailure.text),
                  heightSecondSegment: double.parse(controller.altitude2ndSegmentFailure.text)
                );
                var profile = Profile(nMotors: nMotorsProfile, failure: failureProfile);
                if (controller.profileImage.value == '') {
                  AircraftModel aircraft = AircraftModel(
                    name: controller.name.text,
                    metro: controller.metro.text,
                    profile: profile
                  );
                  await AircraftService.addAircraft(aircraft);
                } else {
                  AircraftModel aircraft = AircraftModel(
                    name: controller.name.text,
                    metro: controller.metro.text,
                    profile: profile,
                    elevationImage: controller.profileImage.value
                  );
                  await AircraftService.addAircraft(aircraft);
                }
                controller.name.clear();
                controller.metro.clear();
                controller.altitude1stSegmentN.clear();
                controller.altitude1stSegmentFailure.clear();
                controller.altitude2ndSegmentN.clear();
                controller.altitude2ndSegmentFailure.clear();
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