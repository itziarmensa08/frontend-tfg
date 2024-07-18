import 'package:flutter/material.dart';
import 'package:frontend_tfg/pages/new_analysis/new_analysis.controller.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/isa_table.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/vyse_table.dart';
import 'package:get/get.dart';

class ThirdSegmentSecondStepGradient extends StatelessWidget {
  ThirdSegmentSecondStepGradient({super.key});

  final controller = Get.put(NewAnalaysisController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('reviewDataSecondSegment'.tr, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextFormField(
                controller: controller.elevationThirdSegmentN1,
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
                controller: controller.weight,
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
          ],
        ),
        const SizedBox(height: 50),
        Center(child: Obx(() => VyseTable(table: controller.vYtableN1.value, obtainedData: controller.obtainedDataThirdVYN1))),
        const SizedBox(height: 50),
        Row(
          children: [
            Text('finalVelocityIAS'.tr, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: controller.velocityThirdSegmentN1,
                onChanged: (value) {
                  controller.thirdSegmentN1.value.velocityIAS = double.parse(value);
                  controller.gradient.value.thirdSegment = controller.thirdSegmentN1.value;
                  controller.failure.value.gradient = controller.gradient.value;
                  controller.newProcedure.value.failure = controller.failure.value;
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
        ),
        const SizedBox(height: 50),
        Center(child: Obx(() {
          if (controller.obtainedISADataThirdSegmentN1.isNotEmpty) {
            return ISATable(table: controller.isatable.value, obtainedData: controller.obtainedISADataThirdSegmentN1);
          } else {
            return const LinearProgressIndicator();
          }
        })),
        const SizedBox(height: 50),
        Row(
          children: [
            Text('finalDensity'.tr, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: controller.densityThirdSegmentN1,
                onChanged: (value) {
                  controller.thirdSegmentN1.value.density = double.parse(value);
                  controller.gradient.value.thirdSegment = controller.thirdSegmentN1.value;
                  controller.failure.value.gradient = controller.gradient.value;
                  controller.newProcedure.value.failure = controller.failure.value;
                },
                decoration: InputDecoration(
                  labelText: 'density'.tr,
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
        ),
        const SizedBox(height: 50),
        Row(
          children: [
            Text('finalVelocityTAS'.tr, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: controller.velocityThirdSegmentTASN1,
                onChanged: (value) {
                  controller.thirdSegmentN1.value.velocityTAS = double.parse(value);
                  controller.gradient.value.thirdSegment = controller.thirdSegmentN1.value;
                  controller.failure.value.gradient = controller.gradient.value;
                  controller.newProcedure.value.failure = controller.failure.value;
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
        ),
        const SizedBox(height: 50),
        Row(
          children: [
            Text('gradientObtained'.tr, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: controller.gradientThirdSegmentN1,
                onChanged: (value) {
                  controller.thirdSegmentN1.value.rateClimb = double.parse(value);
                  controller.gradient.value.thirdSegment = controller.thirdSegmentN1.value;
                  controller.failure.value.gradient = controller.gradient.value;
                  controller.newProcedure.value.failure = controller.failure.value;
                },
                decoration: InputDecoration(
                  labelText: 'gradient'.tr,
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
        ),
        const SizedBox(height: 50),
        Obx(() {
          if (controller.thirdSegmentN.value.reachDP == false) {
            return Text('noArrive'.tr, style: Theme.of(context).textTheme.titleMedium);
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('yesArrive'.tr, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 50),
                Row(
                  children: [
                    Text('altitudeInDP'.tr, style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        controller: controller.altitudeInDPThirdSegmentN1,
                        onChanged: (value) {
                          controller.thirdSegmentN1.value.altitudeInDP = double.parse(value);
                          controller.gradient.value.thirdSegment = controller.thirdSegmentN1.value;
                          controller.failure.value.gradient = controller.gradient.value;
                          controller.newProcedure.value.failure = controller.failure.value;
                        },
                        decoration: InputDecoration(
                          labelText: 'altitude'.tr,
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
                ),
                const SizedBox(height: 50),
                Row(
                  children: [
                    Text('totalAltitudeInDP'.tr, style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        controller: controller.totalAltitudeInDPThirdSegmentN1,
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          labelText: 'altitude'.tr,
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
                ),
                const SizedBox(height: 50),
                Row(
                  children: [
                    Text('finalGradient'.tr, style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        controller: controller.finalGradientN1,
                        onChanged: (value) {

                        },
                        decoration: InputDecoration(
                          labelText: 'gradient'.tr,
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
                ),
              ],
            );
          }
        }),
        const SizedBox(height: 50),
        Obx(() {
          if (controller.thirdSegmentN1.value.clearDP == true && controller.thirdSegmentN1.value.reachDP == true) {
            return Text('clearDP'.tr, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.green));
          } else if (controller.thirdSegmentN1.value.clearDP == false && controller.thirdSegmentN1.value.reachDP == true) {
            return Text('noClearDP'.tr, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.red));
          } else {
            return Container();
          }
        })
      ],
    );
  }
}