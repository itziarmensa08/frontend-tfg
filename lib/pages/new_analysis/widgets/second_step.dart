
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
        Text('reviewDataFirstSegment'.tr, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 30),
        Obx(() =>
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFormField(
                  initialValue: controller.selectedAirport.value?.elevation.toString(),
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
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextFormField(
                  initialValue: controller.newProcedure.value.weight.toString(),
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'weight'.tr,
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
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextFormField(
                  initialValue: controller.selectedAirport.value!.referenceTemperature.toString(),
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
                  ),
                ),
              ),
            ],
          )
        ),
        const SizedBox(height: 50),
        Center(child: Obx(() => SpeedTable(table: controller.data.value, obtainedData: controller.obtainedData))),
        const SizedBox(height: 50),
        Row(
          children: [
            Text('finalVelocity'.tr, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 20),
            Expanded(
              child: TextFormField(
                controller: controller.velocityFirstSegment,
                onChanged: (value) {
              
                },
                decoration: InputDecoration(
                  labelText: 'velocity'.tr,
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
                ),
              ),
            ),
          ],
        )

      ],
    );
  }
}