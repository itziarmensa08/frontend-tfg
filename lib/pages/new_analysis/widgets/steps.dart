
import 'package:flutter/material.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/first_step.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/second_step.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/third_step.dart';
import 'package:get/get.dart';

List<Step> getSteps (controller) => [
  Step(
    isActive: controller.indexStepper.value >= 0,
    title: Text('step1Title'.tr),
    content: FirstStep(controller: controller),
  ),
  Step(
    isActive: controller.indexStepper.value >= 1,
    title: Text('step2title'.tr),
    content: const SecondStep(),
  ),
  Step(
    isActive: controller.indexStepper.value >= 2,
    title: Text('step3title'.tr),
    content: const ThirdStep(),
  ),
  Step(
    isActive: controller.indexStepper.value >= 3,
    title: Text('step4title'.tr),
    content: const Text('Content for Step 4'),
  ),
];