
import 'package:flutter/material.dart';
import 'package:frontend_tfg/pages/new_analysis/new_analysis.controller.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/v2_table.dart';
import 'package:get/get.dart';

class SecondStep extends StatelessWidget {
  const SecondStep({super.key, required this.controller});

  final NewAnalaysisController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() => SpeedTable(table: controller.data.value))
      ],
    );
  }
}