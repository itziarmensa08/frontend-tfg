import 'package:flutter/material.dart';
import 'package:frontend_tfg/pages/new_analysis/new_analysis.controller.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/isa_table.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/rate_chart.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/v2_table.dart';
import 'package:get/get.dart';

class FirstSegmentSecondStep extends StatelessWidget {
  FirstSegmentSecondStep({super.key});

  final controller = Get.put(NewAnalaysisController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('reviewDataFirstSegment'.tr, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextFormField(
                controller: controller.elevation,
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
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: controller.referenceTemperature,
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
        ),
        const SizedBox(height: 50),
        Center(child: Obx(() => SpeedTable(table: controller.data.value, obtainedData: controller.obtainedDataN1))),
        const SizedBox(height: 50),
        /*Row(
          children: [
            Text('finalVelocityIAS'.tr, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: controller.velocityFirstSegmentN1,
                onChanged: (value) {
                  controller.newProcedure.value.firstSegment!.velocityIAS = double.parse(value);
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
        Center(child: Obx(() => ISATable(table: controller.isatable.value, obtainedData: controller.obtainedISAData))),
        const SizedBox(height: 50),
        Row(
          children: [
            Text('finalDensity'.tr, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: controller.densityFirstSegment,
                onChanged: (value) {
                  controller.newProcedure.value.firstSegment!.density = double.parse(value);
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
                controller: controller.velocityFirstSegmentTAS,
                onChanged: (value) {
                  controller.newProcedure.value.firstSegment!.velocityTAS = double.parse(value);
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
        Center(child: Obx(() => RateChart(rateGraphic: controller.rateGraphic.value, resultRate: controller.resultRate,))),
        const SizedBox(height: 50),
        Row(
          children: [
            Text('finalRateOfClimb'.tr, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: controller.rateOfClimbFirstSegment,
                onChanged: (value) {
                  controller.newProcedure.value.firstSegment!.rateClimb = double.parse(value);
                },
                decoration: InputDecoration(
                  labelText: 'rateOfClimb'.tr,
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
            Text('timeFirstSegment'.tr, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: controller.timeFirstSegment,
                onChanged: (value) {
                  controller.newProcedure.value.firstSegment!.timeToFinish = double.parse(value);
                },
                decoration: InputDecoration(
                  labelText: 'time'.tr,
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
            Text('distanceFirstSegment'.tr, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: controller.distanceFirstSegment,
                onChanged: (value) {
                  controller.newProcedure.value.firstSegment!.distanceToFinish = double.parse(value);
                },
                decoration: InputDecoration(
                  labelText: 'distance'.tr,
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
          if (controller.newProcedure.value.firstSegment != null) {
            if (controller.newProcedure.value.firstSegment!.distanceToFinish! < controller.newProcedure.value.dpDistance!) {
              return Text('noArrive'.tr, style: Theme.of(context).textTheme.titleMedium);
            } else {
              controller.newProcedure.value.firstSegment!.reachDP = true;
              controller.newProcedure.value.firstSegment!.timeToDP = controller.newProcedure.value.dpDistance! / controller.newProcedure.value.firstSegment!.velocityTAS!;
              controller.timeToDPFirstSegment.text = (controller.newProcedure.value.dpDistance! / controller.newProcedure.value.firstSegment!.velocityTAS!).toString();

              controller.newProcedure.value.firstSegment!.altitudeInDP = controller.newProcedure.value.firstSegment!.timeToDP! * controller.newProcedure.value.firstSegment!.rateClimb!;
              controller.altitudeInDPFirstSegment.text = (controller.newProcedure.value.firstSegment!.timeToDP! * controller.newProcedure.value.firstSegment!.rateClimb!).toString();

              if ((controller.newProcedure.value.firstSegment!.altitudeInDP! + controller.selectedAirport.value!.elevation!) > controller.newProcedure.value.dpAltitude!) {
                controller.newProcedure.value.firstSegment!.clearDP = true;
              } else {
                controller.newProcedure.value.firstSegment!.clearDP = false;
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('yesArrive'.tr, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      Text('timeToDP'.tr, style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextFormField(
                          controller: controller.timeToDPFirstSegment,
                          onChanged: (value) {
                            controller.newProcedure.value.firstSegment!.timeToDP = double.parse(value);
                          },
                          decoration: InputDecoration(
                            labelText: 'time'.tr,
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
                      Text('altitudeInDP'.tr, style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextFormField(
                          controller: controller.altitudeInDPFirstSegment,
                          onChanged: (value) {
                            controller.newProcedure.value.firstSegment!.altitudeInDP = double.parse(value);
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
                ],
              );
            }
          } else {
            return const CircularProgressIndicator();
          }
        }),
        const SizedBox(height: 50),
        Obx(() {
          if (controller.newProcedure.value.firstSegment != null && controller.newProcedure.value.firstSegment!.clearDP == true) {
            return Text('clearDP'.tr, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.green));
          } else if (controller.newProcedure.value.firstSegment != null && controller.newProcedure.value.firstSegment!.clearDP == false) {
            return Text('noClearDP'.tr, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.red));
          } else {
            return const CircularProgressIndicator();
          }
        })*/
      ],
    );
  }
}