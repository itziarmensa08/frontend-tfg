
import 'package:flutter/material.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/first_step.dart';
import 'package:get/get.dart';

List<Step> getSteps (controller) => [
  Step(
    isActive: controller.indexStepper.value >= 0,
    title: Text('step1Title'.tr),
    content: FirstStep(controller: controller),
  ),
  Step(
    isActive: controller.indexStepper.value >= 1,
    title: Text('Step 2 title'),
    content: Text('Content for Step 2'),
  ),
  Step(
    isActive: controller.indexStepper.value >= 2,
    title: Text('Step 3 title'),
    content: Text('Content for Step 3'),
  ),
  Step(
    isActive: controller.indexStepper.value >= 3,
    title: Text('Step 4 title'),
    content: Text('Content for Step 4'),
  ),
];