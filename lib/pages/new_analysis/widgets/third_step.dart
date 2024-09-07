import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/services/gradientgraphic.service.dart';
import 'package:frontend_tfg/data/services/isatable.service.dart';
import 'package:frontend_tfg/data/services/rateofclimbgraphic.service.dart';
import 'package:frontend_tfg/data/services/v2table.service.dart';
import 'package:frontend_tfg/data/services/vYtable.service.dart';
import 'package:frontend_tfg/pages/new_analysis/new_analysis.controller.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/first_segment_second_altitude.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/first_segment_second_gradient.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/second_segment_second_altitude.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/second_segment_second_gradient.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/third_segment_second_altitude.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/third_segment_second_gradient.dart';
import 'package:get/get.dart';

class ThirdStep extends StatefulWidget {
  const ThirdStep({super.key, required this.controller});

  final NewAnalaysisController controller;

  @override
  State<ThirdStep> createState() => ThirdStepState();
}

class ThirdStepState extends State<ThirdStep> {
  List<Item> items = [];

  void generateItemsAltitude(bool reachDP1, bool reachDP2, bool reachDP3) {
    setState(() {
      items = [
        if (double.parse(widget.controller.initialElevation.text) < widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment!)
          Item(
            headerValue: 'segment1'.tr,
            body: FirstSegmentSecondStepAltitude(),
          ),
        if ((double.parse(widget.controller.initialElevation.text) < widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment! ||
            (double.parse(widget.controller.initialElevation.text) > widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment! && double.parse(widget.controller.initialElevation.text) < widget.controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment!)) && !reachDP1)
          Item(
            headerValue: 'segment2'.tr,
            body: SecondSegmentSecondStepAltitude(),
          ),
        if (!reachDP1 && ! reachDP2)
          Item(
            headerValue: 'segment3'.tr,
            body: ThirdSegmentSecondStepAltitude(),
          ),
      ];
    });
  }

  void generateItemsGradient(bool reachDP1, bool reachDP2, bool reachDP3) {
    setState(() {
      items = [
        if (double.parse(widget.controller.initialElevation.text) < widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment!)
          Item(
            headerValue: 'segment1'.tr,
            body: FirstSegmentSecondStepGradient(),
          ),
        if ((double.parse(widget.controller.initialElevation.text) < widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment! ||
            (double.parse(widget.controller.initialElevation.text) > widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment! && double.parse(widget.controller.initialElevation.text) < widget.controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment!))  && !reachDP1)
          Item(
            headerValue: 'segment2'.tr,
            body: SecondSegmentSecondStepGradient(),
          ),
        if (!reachDP1 && ! reachDP2)
          Item(
            headerValue: 'segment3'.tr,
            body: ThirdSegmentSecondStepGradient(),
          ),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.controller.indexStepper.value == 2) {
      return SingleChildScrollView(
        child: Obx(() {
          if (widget.controller.firstSegmentN.value.clearDP != false && widget.controller.secondSegmentN.value.clearDP != false && widget.controller.thirdSegmentN.value.clearDP != false) {
            return Text('not_necessary'.tr, style: Theme.of(context).textTheme.titleMedium);
          } else {
            return _buildPanel(widget.controller);
          }
        }),
      );
    } else {
      return const LinearProgressIndicator();
    }
  }

  Widget _buildPanel(NewAnalaysisController controller) {
    return Column(
      children: [
        Text('reviewDataFirstSegment_N_1'.tr, style: Theme.of(context).textTheme.titleMedium),
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
        const SizedBox(height: 30),
        Row(
          children: [
            Text('enter_initial_elevation'.tr, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: controller.initialElevation,
                onChanged: (value) {
                  controller.failure.value.initialElevation = double.parse(value);
                },
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
          ],
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            Text('select_restriction'.tr, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                controller.seeAnalysis.value = false;
                controller.altitudeRestriction.value = true;
                controller.gradientRestriction.value = false;
                controller.altitude.value.state = true;
                controller.gradient.value.state = false;
                controller.failure.value.altitude = controller.altitude.value;
                controller.failure.value.gradient = controller.gradient.value;
                controller.newProcedure.value.failure = controller.failure.value;
              },
              child: Text('minimum_altitude'.tr),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                controller.seeAnalysis.value = false;
                controller.altitudeRestriction.value = false;
                controller.gradientRestriction.value = true;
                controller.altitude.value.state = false;
                controller.gradient.value.state = true;
                controller.failure.value.altitude = controller.altitude.value;
                controller.failure.value.gradient = controller.gradient.value;
                controller.newProcedure.value.failure = controller.failure.value;
              },
              child: Text('minimum_gradient'.tr),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Obx(() {
          if (controller.gradientRestriction.value == true) {
            return Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.dpDistanceGradient,
                        onChanged: (value) {
                          controller.gradient.value.dpDistance = double.parse(value);
                          controller.failure.value.gradient = controller.gradient.value;
                          controller.newProcedure.value.failure = controller.failure.value;
                        },
                        decoration: InputDecoration(
                          labelText: 'dpDistance'.tr,
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
                        controller: controller.gradientRestrictionValue,
                        onChanged: (value) {
                          controller.gradient.value.gradientValue = double.parse(value);
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
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    if (controller.gradientRestriction.value == true) {
                      var reachDP1 = false;
                      var reachDP2 = false;
                      var reachDP3 = false;
                      controller.loadingAnalysis.value = true;
                      if (double.parse(widget.controller.initialElevation.text) < widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment!) {
                        var resultrateresponseN = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphic.value.id!, controller.selectedAirport.value!.referenceTemperature!, controller.selectedAirport.value!.elevation!, double.parse(controller.weight.text));
                        if (resultrateresponseN != null) {
                          if (controller.firstSegmentN.value.velocityTAS != null) {
                            controller.failure.value.distanceToInitial = controller.firstSegmentN.value.velocityTAS! * (((controller.failure.value.initialElevation! - 50) / resultrateresponseN['finalPoint']['x'])/60);
                          }
                        }
                      } else if ((double.parse(widget.controller.initialElevation.text) < widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment! || (double.parse(widget.controller.initialElevation.text) > widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment! && double.parse(widget.controller.initialElevation.text) < widget.controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment!))) {
                        var resultrateresponseN = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphic.value.id!, controller.selectedAirport.value!.referenceTemperature!, (controller.selectedAirport.value!.elevation! + controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment!), double.parse(controller.weight.text));
                        if (resultrateresponseN != null) {
                          if (controller.firstSegmentN.value.velocityTAS != null) {
                            var distance = controller.firstSegmentN.value.velocityTAS! * (((controller.failure.value.initialElevation! - controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment!) / resultrateresponseN['finalPoint']['x'])/60);
                            controller.failure.value.distanceToInitial = controller.firstSegmentN.value.distanceToFinish! + distance;
                          }
                        }
                        controller.firstSegmentN1.value.reachDP = false;
                      } else {
                        var resultrateresponseN = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphic.value.id!, controller.selectedAirport.value!.referenceTemperature!, (controller.selectedAirport.value!.elevation! + controller.selectedAircraft.value!.profile!.nMotors!.heightSecondSegment!), double.parse(controller.weight.text));
                        if (resultrateresponseN != null) {
                          if (controller.firstSegmentN.value.velocityTAS != null) {
                            var distance = controller.firstSegmentN.value.velocityTAS! * (((controller.failure.value.initialElevation! - controller.selectedAircraft.value!.profile!.nMotors!.heightSecondSegment!) / resultrateresponseN['finalPoint']['x'])/60);
                            controller.failure.value.distanceToInitial = controller.firstSegmentN.value.distanceToFinish! + controller.secondSegmentN.value.distanceToFinish! + distance;
                          }
                        }
                        controller.firstSegmentN1.value.reachDP = false;
                        controller.secondSegmentN1.value.reachDP = false;
                      }
                      // ----------------------------- 1st SEGMENT -----------------------------
                      if (double.parse(widget.controller.initialElevation.text) < widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment!) {
                        controller.elevationFirstSegmentN1.text = (controller.selectedAirport.value!.elevation! + controller.failure.value.initialElevation!).toString();
                        var obtainedData = await V2TableService.getObtainedData(controller.selectedAircraft.value!.id!, (controller.failure.value.initialElevation! + controller.selectedAirport.value!.elevation!), double.parse(controller.weight.text), controller.selectedAirport.value!.referenceTemperature!, "V2");
                        if (obtainedData != null) {
                          controller.obtainedDataN1.value = obtainedData.dataList;
                          controller.velocityFirstSegmentN1.text = obtainedData.velocityValue.toString();
                          controller.firstSegmentN1.value.velocityIAS = obtainedData.velocityValue;
                        }
                        var obtainedDataISA = await ISATableService.getObtainedData((controller.failure.value.initialElevation! + controller.selectedAirport.value!.elevation!));
                        if (obtainedDataISA != null) {
                          controller.obtainedISADataFirstSegmentN1.value = obtainedDataISA.dataList;
                          controller.densityFirstSegmentN1.text = obtainedDataISA.densityValue.toString();
                          controller.firstSegmentN1.value.density = obtainedDataISA.densityValue;
                        }
                        if (obtainedData != null && obtainedDataISA != null) {
                          double velocityTAS = obtainedData.velocityValue / sqrt(obtainedDataISA.densityValue);
                          controller.firstSegmentN1.value.velocityTAS = velocityTAS;
                          controller.velocityFirstSegmentTASN1.text = velocityTAS.toString();
                        }
                        var rateresponse = await RateOfClimbGraphicService.getRateByAircraft(controller.selectedAircraft.value!.id!, 1, "failure");
                        if (rateresponse != null) {
                          controller.rateGraphicFirstSegmentN1.value = rateresponse;
                        }
                        var gradientresponse = await GradientGraphicService.getGradientByAircraft(controller.selectedAircraft.value!.id!, 1);
                        if (gradientresponse != null) {
                          controller.gradientGraphicFirstSegmentN1.value = gradientresponse;
                        }
                        var resultrateresponse = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphicFirstSegmentN1.value.id!, controller.selectedAirport.value!.referenceTemperature!, (controller.failure.value.initialElevation! + controller.selectedAirport.value!.elevation!), double.parse(controller.weight.text));
                        if (resultrateresponse != null) {
                          controller.resultRateFirstSegmentN1.value = resultrateresponse;
                          controller.firstSegmentN1.value.rateClimb = resultrateresponse['finalPoint']['x'];
                          controller.gradientFirstSegmentN1.text = resultrateresponse['finalPoint']['x'].toString();
                          var resultgradientresponse = await GradientGraphicService.calculateDistance(controller.gradientGraphicFirstSegmentN1.value.id!, resultrateresponse['finalPoint']['x'], widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment! - 35);
                          if (resultgradientresponse != null) {
                            controller.resultGradientFirstSegmentN1.value = resultgradientresponse;
                            controller.firstSegmentN1.value.distanceToFinish = resultgradientresponse['thirdPoint']['x'];
                            controller.distanceFirstSegmentN1.text = resultgradientresponse['thirdPoint']['x'].toString();
                          }
                        }
                        if (controller.firstSegmentN1.value.distanceToFinish != null && controller.gradient.value.dpDistance != null) {
                          if ((controller.firstSegmentN1.value.distanceToFinish! + controller.failure.value.distanceToInitial!) < controller.gradient.value.dpDistance!) {
                            controller.firstSegmentN1.value.reachDP = false;
                          } else {
                            controller.firstSegmentN1.value.reachDP = true;
                            reachDP1 = true;

                            controller.firstSegmentN1.value.altitudeInDP = ((controller.gradient.value.dpDistance! - controller.failure.value.distanceToInitial!) * 6076.12 * controller.firstSegmentN1.value.rateClimb!) / 100;
                            controller.altitudeInDPFirstSegmentN1.text = (((controller.gradient.value.dpDistance! - controller.failure.value.distanceToInitial!) * 6076.12 * controller.firstSegmentN1.value.rateClimb!) / 100).toString();
                            controller.totalAltitudeInDPFirstSegmentN1.text = (controller.firstSegmentN1.value.altitudeInDP! + controller.selectedAirport.value!.elevation! + controller.failure.value.initialElevation!).toString();
                            var height = controller.firstSegmentN1.value.altitudeInDP!;
                            var distanceFeet = controller.gradient.value.dpDistance! * 6076.12;
                            controller.gradient.value.finalGradient = (height / distanceFeet) * 100;
                            controller.finalGradientN1.text = ((height / distanceFeet) * 100).toStringAsFixed(2);

                            if (controller.gradient.value.finalGradient! > controller.gradient.value.gradientValue!) {
                              controller.firstSegmentN1.value.clearDP = true;
                            } else {
                              controller.firstSegmentN1.value.clearDP = false;
                            }
                          }
                        }
                      }
                      // ---------------------- 2 SEGMENT -------------------------------------------
                      if ((double.parse(widget.controller.initialElevation.text) < widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment! || (double.parse(widget.controller.initialElevation.text) > widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment! && double.parse(widget.controller.initialElevation.text) < widget.controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment!))) {
                        controller.elevationSecondSegmentN1.text = (controller.selectedAirport.value!.elevation! + widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment!).toString();
                        if (controller.firstSegmentN1.value.reachDP == false) {
                          var responseVY = await VYTableService.getVYtableByAircraft(controller.selectedAircraft.value!.id!, "failure");
                          if (responseVY != null) {
                            controller.vYtableN1.value = responseVY;
                          }
                          var obtainedDataVY = await VYTableService.getObtainedData(controller.selectedAircraft.value!.id!, (controller.selectedAirport.value!.elevation! + widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment!), double.parse(controller.weight.text), "failure");
                          if (obtainedDataVY != null) {
                            controller.obtainedDataVYN1.value = obtainedDataVY.dataList;
                            controller.velocitySecondSegmentN1.text = obtainedDataVY.velocityValue.toStringAsFixed(2);
                            controller.secondSegmentN1.value.velocityIAS = obtainedDataVY.velocityValue;
                          }
                          var obtainedDataISASecondSegment = await ISATableService.getObtainedData((controller.selectedAirport.value!.elevation! + widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment!));
                          if (obtainedDataISASecondSegment != null) {
                            controller.obtainedISADataSecondSegmentN1.value = obtainedDataISASecondSegment.dataList;
                            controller.densitySecondSegmentN1.text = obtainedDataISASecondSegment.densityValue.toStringAsFixed(2);
                            controller.secondSegmentN1.value.density = obtainedDataISASecondSegment.densityValue;
                          }
                          if (obtainedDataVY != null && obtainedDataISASecondSegment != null) {
                            double velocityTAS = obtainedDataVY.velocityValue / sqrt(obtainedDataISASecondSegment.densityValue);
                            controller.secondSegmentN1.value.velocityTAS = velocityTAS;
                            controller.velocitySecondSegmentTASN1.text = velocityTAS.toStringAsFixed(2);
                          }
                          var rateresponseSecond = await RateOfClimbGraphicService.getRateByAircraft(controller.selectedAircraft.value!.id!, 2, "failure");
                          if (rateresponseSecond != null) {
                            controller.rateGraphicSecondSegmentN1.value = rateresponseSecond;
                          }
                          var gradientresponseSecond = await GradientGraphicService.getGradientByAircraft(controller.selectedAircraft.value!.id!, 2);
                          if (gradientresponseSecond != null) {
                            controller.gradientGraphicSecondSegmentN1.value = gradientresponseSecond;
                          }
                          var resultrateresponseSecond = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphicSecondSegmentN1.value.id!, controller.selectedAirport.value!.referenceTemperature!, (controller.selectedAirport.value!.elevation! + widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment!), double.parse(controller.weight.text));
                          if (resultrateresponseSecond != null) {
                            controller.resultRateSecondSegmentN1.value = resultrateresponseSecond;
                            controller.secondSegmentN1.value.rateClimb = resultrateresponseSecond['finalPoint']['x'];
                            controller.gradientSecondSegmentN1.text = resultrateresponseSecond['finalPoint']['x'].toString();
                            var resultgradientresponse = await GradientGraphicService.calculateDistance(controller.gradientGraphicSecondSegmentN1.value.id!, resultrateresponseSecond['finalPoint']['x'], widget.controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment! - widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment!);
                            if (resultgradientresponse != null) {
                              controller.resultGradientSecondSegmentN1.value = resultgradientresponse;
                              controller.secondSegmentN1.value.distanceToFinish = resultgradientresponse['thirdPoint']['x'];
                              controller.distanceSecondSegmentN1.text = resultgradientresponse['thirdPoint']['x'].toString();
                            }
                          }
                          if (controller.secondSegmentN1.value.distanceToFinish != null && controller.gradient.value.dpDistance != null) {
                            if ((controller.secondSegmentN1.value.distanceToFinish! + (controller.firstSegmentN1.value.distanceToFinish ?? 0) + controller.failure.value.distanceToInitial!) < controller.gradient.value.dpDistance!) {
                              controller.secondSegmentN1.value.reachDP = false;
                            } else {
                              controller.secondSegmentN1.value.reachDP = true;
                              reachDP2 = true;

                              controller.secondSegmentN1.value.altitudeInDP = ((controller.gradient.value.dpDistance! - controller.failure.value.distanceToInitial!) * 6076.12 * controller.secondSegmentN1.value.rateClimb!) / 100;
                              controller.altitudeInDPSecondSegmentN1.text = (((controller.gradient.value.dpDistance! - controller.failure.value.distanceToInitial!) * 6076.12 * controller.secondSegmentN1.value.rateClimb!) / 100).toString();
                              controller.totalAltitudeInDPSecondSegmentN1.text = (controller.secondSegmentN1.value.altitudeInDP! + widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment! + controller.selectedAirport.value!.elevation!).toString();
                              var height = controller.secondSegmentN1.value.altitudeInDP! + widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment! - controller.selectedAirport.value!.elevation!;
                              var distanceFeet = controller.gradient.value.dpDistance! * 6076.12;
                              controller.gradient.value.finalGradient = (height / distanceFeet) * 100;
                              controller.finalGradientN1.text = ((height / distanceFeet) * 100).toStringAsFixed(2);

                              if (controller.gradient.value.finalGradient! > controller.gradient.value.gradientValue!) {
                                controller.secondSegmentN1.value.clearDP = true;
                              } else {
                                controller.secondSegmentN1.value.clearDP = false;
                              }
                            }
                          }
                        }
                      }

                      // ---------------------- 3 SEGMENT -------------------------------------------

                      controller.elevationThirdSegmentN1.text = (controller.selectedAirport.value!.elevation! + widget.controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment!).toString();
                      if (controller.secondSegmentN1.value.reachDP == false) {
                        var responseVY = await VYTableService.getVYtableByAircraft(controller.selectedAircraft.value!.id!, "failure");
                        if (responseVY != null) {
                          controller.vYtableN1.value = responseVY;
                        }
                        var obtainedDataVY = await VYTableService.getObtainedData(controller.selectedAircraft.value!.id!, (controller.selectedAirport.value!.elevation! + widget.controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment!), double.parse(controller.weight.text), "failure");
                        if (obtainedDataVY != null) {
                          controller.obtainedDataThirdVYN1.value = obtainedDataVY.dataList;
                          controller.velocityThirdSegmentN1.text = obtainedDataVY.velocityValue.toStringAsFixed(2);
                          controller.thirdSegmentN1.value.velocityIAS = obtainedDataVY.velocityValue;
                        }
                        var obtainedDataISAThirdSegment = await ISATableService.getObtainedData((controller.selectedAirport.value!.elevation! + widget.controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment!));
                        if (obtainedDataISAThirdSegment != null) {
                          controller.obtainedISADataThirdSegmentN1.value = obtainedDataISAThirdSegment.dataList;
                          controller.densityThirdSegmentN1.text = obtainedDataISAThirdSegment.densityValue.toStringAsFixed(2);
                          controller.thirdSegmentN1.value.density = obtainedDataISAThirdSegment.densityValue;
                        }
                        if (obtainedDataVY != null && obtainedDataISAThirdSegment != null) {
                          double velocityTAS = obtainedDataVY.velocityValue / sqrt(obtainedDataISAThirdSegment.densityValue);
                          controller.thirdSegmentN1.value.velocityTAS = velocityTAS;
                          controller.velocityThirdSegmentTASN1.text = velocityTAS.toStringAsFixed(2);
                        }
                        var rateresponseThird = await RateOfClimbGraphicService.getRateByAircraft(controller.selectedAircraft.value!.id!, 3, "failure");
                        if (rateresponseThird != null) {
                          controller.rateGraphicThirdSegmentN1.value = rateresponseThird;
                        }
                        var resultrateresponseThird = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphicThirdSegmentN1.value.id!, controller.selectedAirport.value!.referenceTemperature!, (controller.selectedAirport.value!.elevation! + widget.controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment!), double.parse(controller.weight.text));
                        if (resultrateresponseThird != null) {
                          controller.resultRateThirdSegmentN1.value = resultrateresponseThird;
                          controller.thirdSegmentN1.value.rateClimb = resultrateresponseThird['finalPoint']['x'];
                          controller.rateOfClimbThirdSegmentN1.text = resultrateresponseThird['finalPoint']['x'].toStringAsFixed(2);
                        }
                        if (controller.gradient.value.dpDistance != null) {
                          controller.thirdSegmentN1.value.reachDP = true;
                          reachDP3 = true;

                          controller.thirdSegmentN1.value.timeToDP = ((controller.gradient.value.dpDistance! - (controller.failure.value.distanceToInitial! + (controller.firstSegmentN1.value.distanceToFinish ?? 0) + (controller.secondSegmentN1.value.distanceToFinish ?? 0))) / controller.thirdSegmentN1.value.velocityTAS!) * 60;
                          controller.timeToDPThirdSegmentN1.text = (((controller.gradient.value.dpDistance! - (controller.failure.value.distanceToInitial! + (controller.firstSegmentN1.value.distanceToFinish ?? 0) + (controller.secondSegmentN1.value.distanceToFinish ?? 0))) / controller.thirdSegmentN1.value.velocityTAS!) * 60).toStringAsFixed(2);

                          controller.thirdSegmentN1.value.altitudeInDP = controller.thirdSegmentN1.value.timeToDP! * controller.thirdSegmentN1.value.rateClimb!;
                          controller.altitudeInDPThirdSegmentN1.text = (controller.thirdSegmentN1.value.timeToDP! * controller.thirdSegmentN1.value.rateClimb!).toStringAsFixed(2);

                          controller.totalAltitudeInDPThirdSegmentN1.text = (controller.thirdSegmentN1.value.altitudeInDP! + widget.controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment! + controller.selectedAirport.value!.elevation!).toString();
                          var height = controller.thirdSegmentN1.value.altitudeInDP! + widget.controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment! - controller.selectedAirport.value!.elevation!;
                          var distanceFeet = controller.gradient.value.dpDistance! * 6076.12;
                          controller.gradient.value.finalGradient = (height / distanceFeet) * 100;
                          controller.finalGradientN1.text = ((height / distanceFeet) * 100).toStringAsFixed(2);

                          if (controller.gradient.value.finalGradient! > controller.gradient.value.gradientValue!) {
                            controller.thirdSegmentN1.value.clearDP = true;
                          } else {
                            controller.thirdSegmentN1.value.clearDP = false;
                          }
                        }
                      }
                      controller.gradient.value.firstSegment = controller.firstSegmentN1.value;
                      controller.gradient.value.secondSegment = controller.secondSegmentN1.value;
                      controller.gradient.value.thirdSegment = controller.thirdSegmentN1.value;
                      controller.failure.value.gradient = controller.gradient.value;

                      generateItemsGradient(reachDP1, reachDP2, reachDP3);
                      controller.newProcedure.value.failure = controller.failure.value;
                      widget.controller.seeAnalysis.value = true;
                    }
                    controller.loadingAnalysis.value = false;

                  },
                  child: Text('start_analysis'.tr),
                ),
              ],
            );
          } else if (controller.altitudeRestriction.value == true) {
            return Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.dpDistanceAltitude,
                        onChanged: (value) {
                          controller.altitude.value.dpDistance = double.parse(value);
                          controller.failure.value.altitude = controller.altitude.value;
                          controller.newProcedure.value.failure = controller.failure.value;
                        },
                        decoration: InputDecoration(
                          labelText: 'dpDistance'.tr,
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
                        controller: controller.dpAltitudeRestriction,
                        onChanged: (value) {
                          controller.altitude.value.dpElevation = double.parse(value);
                          controller.failure.value.altitude = controller.altitude.value;
                          controller.newProcedure.value.failure = controller.failure.value;
                        },
                        decoration: InputDecoration(
                          labelText: 'dpAltitude'.tr,
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
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    if (controller.altitudeRestriction.value == true) {
                      var reachDP1 = false;
                      var reachDP2 = false;
                      var reachDP3 = false;
                      controller.loadingAnalysis.value = true;
                      if (double.parse(widget.controller.initialElevation.text) < widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment!) {
                        var resultrateresponseN = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphic.value.id!, controller.selectedAirport.value!.referenceTemperature!, controller.selectedAirport.value!.elevation!, double.parse(controller.weight.text));
                        if (resultrateresponseN != null) {
                          if (controller.firstSegmentN.value.velocityTAS != null) {
                            controller.failure.value.distanceToInitial = controller.firstSegmentN.value.velocityTAS! * (((controller.failure.value.initialElevation! - 50) / resultrateresponseN['finalPoint']['x'])/60);
                          }
                        }
                      } else if ((double.parse(widget.controller.initialElevation.text) < widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment! || (double.parse(widget.controller.initialElevation.text) > widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment! && double.parse(widget.controller.initialElevation.text) < widget.controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment!))) {
                        var resultrateresponseN = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphic.value.id!, controller.selectedAirport.value!.referenceTemperature!, (controller.selectedAirport.value!.elevation! + controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment!), double.parse(controller.weight.text));
                        if (resultrateresponseN != null) {
                          if (controller.firstSegmentN.value.velocityTAS != null) {
                            var distance = controller.firstSegmentN.value.velocityTAS! * (((controller.failure.value.initialElevation! - controller.selectedAircraft.value!.profile!.nMotors!.heightFirstSegment!) / resultrateresponseN['finalPoint']['x'])/60);
                            controller.failure.value.distanceToInitial = controller.firstSegmentN.value.distanceToFinish! + distance;
                          }
                        }
                        controller.firstSegmentN1.value.reachDP = false;
                      } else {
                        var resultrateresponseN = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphic.value.id!, controller.selectedAirport.value!.referenceTemperature!, (controller.selectedAirport.value!.elevation! + controller.selectedAircraft.value!.profile!.nMotors!.heightSecondSegment!), double.parse(controller.weight.text));
                        if (resultrateresponseN != null) {
                          if (controller.firstSegmentN.value.velocityTAS != null) {
                            var distance = controller.firstSegmentN.value.velocityTAS! * (((controller.failure.value.initialElevation! - controller.selectedAircraft.value!.profile!.nMotors!.heightSecondSegment!) / resultrateresponseN['finalPoint']['x'])/60);
                            controller.failure.value.distanceToInitial = controller.firstSegmentN.value.distanceToFinish! + controller.secondSegmentN.value.distanceToFinish! + distance;
                          }
                        }
                        controller.firstSegmentN1.value.reachDP = false;
                        controller.secondSegmentN1.value.reachDP = false;
                      }
                      // ----------------------------- 1st SEGMENT -----------------------------
                      if (double.parse(widget.controller.initialElevation.text) < widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment!) {
                        controller.elevationFirstSegmentN1.text = (controller.selectedAirport.value!.elevation! + controller.failure.value.initialElevation!).toString();
                        var obtainedData = await V2TableService.getObtainedData(controller.selectedAircraft.value!.id!, (controller.failure.value.initialElevation! + controller.selectedAirport.value!.elevation!), double.parse(controller.weight.text), controller.selectedAirport.value!.referenceTemperature!, "V2");
                        if (obtainedData != null) {
                          controller.obtainedDataN1.value = obtainedData.dataList;
                          controller.velocityFirstSegmentN1.text = obtainedData.velocityValue.toString();
                          controller.firstSegmentN1.value.velocityIAS = obtainedData.velocityValue;
                        }
                        var obtainedDataISA = await ISATableService.getObtainedData((controller.failure.value.initialElevation! + controller.selectedAirport.value!.elevation!));
                        if (obtainedDataISA != null) {
                          controller.obtainedISADataFirstSegmentN1.value = obtainedDataISA.dataList;
                          controller.densityFirstSegmentN1.text = obtainedDataISA.densityValue.toString();
                          controller.firstSegmentN1.value.density = obtainedDataISA.densityValue;
                        }
                        if (obtainedData != null && obtainedDataISA != null) {
                          double velocityTAS = obtainedData.velocityValue / sqrt(obtainedDataISA.densityValue);
                          controller.firstSegmentN1.value.velocityTAS = velocityTAS;
                          controller.velocityFirstSegmentTASN1.text = velocityTAS.toString();
                        }
                        var rateresponse = await RateOfClimbGraphicService.getRateByAircraft(controller.selectedAircraft.value!.id!, 1, "failure");
                        if (rateresponse != null) {
                          controller.rateGraphicFirstSegmentN1.value = rateresponse;
                        }
                        var gradientresponse = await GradientGraphicService.getGradientByAircraft(controller.selectedAircraft.value!.id!, 1);
                        if (gradientresponse != null) {
                          controller.gradientGraphicFirstSegmentN1.value = gradientresponse;
                        }
                        var resultrateresponse = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphicFirstSegmentN1.value.id!, controller.selectedAirport.value!.referenceTemperature!, (controller.failure.value.initialElevation! + controller.selectedAirport.value!.elevation!), double.parse(controller.weight.text));
                        if (resultrateresponse != null) {
                          controller.resultRateFirstSegmentN1.value = resultrateresponse;
                          controller.firstSegmentN1.value.rateClimb = resultrateresponse['finalPoint']['x'];
                          controller.gradientFirstSegmentN1.text = resultrateresponse['finalPoint']['x'].toString();
                          var resultgradientresponse = await GradientGraphicService.calculateDistance(controller.gradientGraphicFirstSegmentN1.value.id!, resultrateresponse['finalPoint']['x'], widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment! - 35);
                          if (resultgradientresponse != null) {
                            controller.resultGradientFirstSegmentN1.value = resultgradientresponse;
                            controller.firstSegmentN1.value.distanceToFinish = resultgradientresponse['thirdPoint']['x'];
                            controller.distanceFirstSegmentN1.text = resultgradientresponse['thirdPoint']['x'].toString();
                          }
                        }
                        if (controller.firstSegmentN1.value.distanceToFinish != null && controller.altitude.value.dpDistance != null) {
                          if ((controller.firstSegmentN1.value.distanceToFinish! + controller.failure.value.distanceToInitial!) < controller.altitude.value.dpDistance!) {
                            controller.firstSegmentN1.value.reachDP = false;
                          } else {
                            controller.firstSegmentN1.value.reachDP = true;
                            reachDP1 = true;

                            controller.firstSegmentN1.value.altitudeInDP = ((controller.altitude.value.dpDistance! - controller.failure.value.distanceToInitial!) * 6076.12 * controller.firstSegmentN1.value.rateClimb!) / 100;
                            controller.altitudeInDPFirstSegmentN1.text = (((controller.altitude.value.dpDistance! - controller.failure.value.distanceToInitial!) * 6076.12 * controller.firstSegmentN1.value.rateClimb!) / 100).toString();
                            controller.totalAltitudeInDPFirstSegmentN1.text = (controller.firstSegmentN1.value.altitudeInDP! + controller.selectedAirport.value!.elevation! + controller.failure.value.initialElevation!).toString();

                            if ((controller.firstSegmentN1.value.altitudeInDP! + controller.selectedAirport.value!.elevation! + controller.failure.value.initialElevation!) > controller.altitude.value.dpElevation!) {
                              controller.firstSegmentN1.value.clearDP = true;
                            } else {
                              controller.firstSegmentN1.value.clearDP = false;
                            }
                          }
                        }
                      }
                      // ---------------------- 2 SEGMENT -------------------------------------------
                      if ((double.parse(widget.controller.initialElevation.text) < widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment! || (double.parse(widget.controller.initialElevation.text) > widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment! && double.parse(widget.controller.initialElevation.text) < widget.controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment!))) {
                        controller.elevationSecondSegmentN1.text = (controller.selectedAirport.value!.elevation! + widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment!).toString();
                        if (controller.firstSegmentN1.value.reachDP == false) {
                          var responseVY = await VYTableService.getVYtableByAircraft(controller.selectedAircraft.value!.id!, "failure");
                          if (responseVY != null) {
                            controller.vYtableN1.value = responseVY;
                          }
                          var obtainedDataVY = await VYTableService.getObtainedData(controller.selectedAircraft.value!.id!, (controller.selectedAirport.value!.elevation! + widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment!), double.parse(controller.weight.text), "failure");
                          if (obtainedDataVY != null) {
                            controller.obtainedDataVYN1.value = obtainedDataVY.dataList;
                            controller.velocitySecondSegmentN1.text = obtainedDataVY.velocityValue.toStringAsFixed(2);
                            controller.secondSegmentN1.value.velocityIAS = obtainedDataVY.velocityValue;
                          }
                          var obtainedDataISASecondSegment = await ISATableService.getObtainedData((controller.selectedAirport.value!.elevation! + widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment!));
                          if (obtainedDataISASecondSegment != null) {
                            controller.obtainedISADataSecondSegmentN1.value = obtainedDataISASecondSegment.dataList;
                            controller.densitySecondSegmentN1.text = obtainedDataISASecondSegment.densityValue.toStringAsFixed(2);
                            controller.secondSegmentN1.value.density = obtainedDataISASecondSegment.densityValue;
                          }
                          if (obtainedDataVY != null && obtainedDataISASecondSegment != null) {
                            double velocityTAS = obtainedDataVY.velocityValue / sqrt(obtainedDataISASecondSegment.densityValue);
                            controller.secondSegmentN1.value.velocityTAS = velocityTAS;
                            controller.velocitySecondSegmentTASN1.text = velocityTAS.toStringAsFixed(2);
                          }
                          var rateresponseSecond = await RateOfClimbGraphicService.getRateByAircraft(controller.selectedAircraft.value!.id!, 2, "failure");
                          if (rateresponseSecond != null) {
                            controller.rateGraphicSecondSegmentN1.value = rateresponseSecond;
                          }
                          var gradientresponseSecond = await GradientGraphicService.getGradientByAircraft(controller.selectedAircraft.value!.id!, 2);
                          if (gradientresponseSecond != null) {
                            controller.gradientGraphicSecondSegmentN1.value = gradientresponseSecond;
                          }
                          var resultrateresponseSecond = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphicSecondSegmentN1.value.id!, controller.selectedAirport.value!.referenceTemperature!, (controller.selectedAirport.value!.elevation! + widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment!), double.parse(controller.weight.text));
                          if (resultrateresponseSecond != null) {
                            controller.resultRateSecondSegmentN1.value = resultrateresponseSecond;
                            controller.secondSegmentN1.value.rateClimb = resultrateresponseSecond['finalPoint']['x'];
                            controller.gradientSecondSegmentN1.text = resultrateresponseSecond['finalPoint']['x'].toString();
                            var resultgradientresponse = await GradientGraphicService.calculateDistance(controller.gradientGraphicSecondSegmentN1.value.id!, resultrateresponseSecond['finalPoint']['x'], widget.controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment! - widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment!);
                            if (resultgradientresponse != null) {
                              controller.resultGradientSecondSegmentN1.value = resultgradientresponse;
                              controller.secondSegmentN1.value.distanceToFinish = resultgradientresponse['thirdPoint']['x'];
                              controller.distanceSecondSegmentN1.text = resultgradientresponse['thirdPoint']['x'].toString();
                            }
                          }
                          if (controller.secondSegmentN1.value.distanceToFinish != null && controller.altitude.value.dpDistance != null) {
                            if ((controller.secondSegmentN1.value.distanceToFinish! + (controller.firstSegmentN1.value.distanceToFinish ?? 0) + controller.failure.value.distanceToInitial!) < controller.altitude.value.dpDistance!) {
                              controller.secondSegmentN1.value.reachDP = false;
                            } else {
                              controller.secondSegmentN1.value.reachDP = true;
                              reachDP2 = true;

                              controller.secondSegmentN1.value.altitudeInDP = ((controller.altitude.value.dpDistance! - ((controller.firstSegmentN1.value.distanceToFinish ?? 0) + controller.failure.value.distanceToInitial!)) * 6076.12) * controller.secondSegmentN1.value.rateClimb! / 100;
                              controller.altitudeInDPSecondSegmentN1.text = (((controller.altitude.value.dpDistance! - ((controller.firstSegmentN1.value.distanceToFinish ?? 0) + controller.failure.value.distanceToInitial!)) * 6076.12) * controller.secondSegmentN1.value.rateClimb! / 100).toString();
                              controller.totalAltitudeInDPSecondSegmentN1.text = (controller.secondSegmentN1.value.altitudeInDP! + widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment! + controller.selectedAirport.value!.elevation!).toString();

                              if ((controller.secondSegmentN1.value.altitudeInDP! + controller.selectedAirport.value!.elevation! + widget.controller.selectedAircraft.value!.profile!.failure!.heightFirstSegment!) > controller.altitude.value.dpElevation!) {
                                controller.secondSegmentN1.value.clearDP = true;
                              } else {
                                controller.secondSegmentN1.value.clearDP = false;
                              }
                            }
                          }
                        }
                      }

                      // ---------------------- 3 SEGMENT -------------------------------------------

                      controller.elevationThirdSegmentN1.text = (controller.selectedAirport.value!.elevation! + widget.controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment!).toString();
                      if (controller.secondSegmentN1.value.reachDP == false) {
                        var responseVY = await VYTableService.getVYtableByAircraft(controller.selectedAircraft.value!.id!, "failure");
                        if (responseVY != null) {
                          controller.vYtableN1.value = responseVY;
                        }
                        var obtainedDataVY = await VYTableService.getObtainedData(controller.selectedAircraft.value!.id!, (controller.selectedAirport.value!.elevation! + widget.controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment!), double.parse(controller.weight.text), "failure");
                        if (obtainedDataVY != null) {
                          controller.obtainedDataThirdVYN1.value = obtainedDataVY.dataList;
                          controller.velocityThirdSegmentN1.text = obtainedDataVY.velocityValue.toStringAsFixed(2);
                          controller.thirdSegmentN1.value.velocityIAS = obtainedDataVY.velocityValue;
                        }
                        var obtainedDataISAThirdSegment = await ISATableService.getObtainedData((controller.selectedAirport.value!.elevation! + widget.controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment!));
                        if (obtainedDataISAThirdSegment != null) {
                          controller.obtainedISADataThirdSegmentN1.value = obtainedDataISAThirdSegment.dataList;
                          controller.densityThirdSegmentN1.text = obtainedDataISAThirdSegment.densityValue.toStringAsFixed(2);
                          controller.thirdSegmentN1.value.density = obtainedDataISAThirdSegment.densityValue;
                        }
                        if (obtainedDataVY != null && obtainedDataISAThirdSegment != null) {
                          double velocityTAS = obtainedDataVY.velocityValue / sqrt(obtainedDataISAThirdSegment.densityValue);
                          controller.thirdSegmentN1.value.velocityTAS = velocityTAS;
                          controller.velocityThirdSegmentTASN1.text = velocityTAS.toStringAsFixed(2);
                        }
                        var rateresponseThird = await RateOfClimbGraphicService.getRateByAircraft(controller.selectedAircraft.value!.id!, 3, "failure");
                        if (rateresponseThird != null) {
                          controller.rateGraphicThirdSegmentN1.value = rateresponseThird;
                        }
                        var gradientresponseThird = await GradientGraphicService.getGradientByAircraft(controller.selectedAircraft.value!.id!, 2);
                        if (gradientresponseThird != null) {
                          controller.gradientGraphicThirdSegmentN1.value = gradientresponseThird;
                        }
                        var resultrateresponseThird = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphicThirdSegmentN1.value.id!, controller.selectedAirport.value!.referenceTemperature!, (controller.selectedAirport.value!.elevation! + widget.controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment!), double.parse(controller.weight.text));
                        if (resultrateresponseThird != null) {
                          controller.resultRateThirdSegmentN1.value = resultrateresponseThird;
                          controller.thirdSegmentN1.value.rateClimb = resultrateresponseThird['finalPoint']['x'];
                          controller.rateOfClimbThirdSegmentN1.text = resultrateresponseThird['finalPoint']['x'].toStringAsFixed(2);
                        }
                        if (controller.altitude.value.dpDistance != null) {
                          controller.thirdSegmentN1.value.reachDP = true;
                          reachDP3 = true;
                          controller.thirdSegmentN1.value.timeToDP = ((controller.altitude.value.dpDistance! - (controller.failure.value.distanceToInitial! + (controller.firstSegmentN1.value.distanceToFinish ?? 0) + (controller.secondSegmentN1.value.distanceToFinish ?? 0))) / controller.thirdSegmentN1.value.velocityTAS!) * 60;
                          controller.timeToDPThirdSegmentN1.text = (((controller.altitude.value.dpDistance! - (controller.failure.value.distanceToInitial! + (controller.firstSegmentN1.value.distanceToFinish ?? 0) + (controller.secondSegmentN1.value.distanceToFinish ?? 0))) / controller.thirdSegmentN1.value.velocityTAS!) * 60).toStringAsFixed(2);

                          controller.thirdSegmentN1.value.altitudeInDP = controller.thirdSegmentN1.value.timeToDP! * controller.thirdSegmentN1.value.rateClimb!;
                          controller.altitudeInDPThirdSegmentN1.text = (controller.thirdSegmentN1.value.timeToDP! * controller.thirdSegmentN1.value.rateClimb!).toStringAsFixed(2);

                          controller.totalAltitudeInDPThirdSegmentN1.text = (controller.thirdSegmentN1.value.altitudeInDP! + widget.controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment! + controller.selectedAirport.value!.elevation!).toString();
                          if ((controller.thirdSegmentN1.value.altitudeInDP! + controller.selectedAirport.value!.elevation! + widget.controller.selectedAircraft.value!.profile!.failure!.heightSecondSegment!) > controller.altitude.value.dpElevation!) {
                            controller.thirdSegmentN1.value.clearDP = true;
                          } else {
                            controller.thirdSegmentN1.value.clearDP = false;
                          }
                        }
                      }
                      controller.altitude.value.firstSegment = controller.firstSegmentN1.value;
                      controller.altitude.value.secondSegment = controller.secondSegmentN1.value;
                      controller.altitude.value.thirdSegment = controller.thirdSegmentN1.value;
                      controller.failure.value.altitude = controller.altitude.value;

                      generateItemsAltitude(reachDP1, reachDP2, reachDP3);
                      controller.newProcedure.value.failure = controller.failure.value;
                      widget.controller.seeAnalysis.value = true;
                    }
                    controller.loadingAnalysis.value = false;
                  },
                  child: Text('start_analysis'.tr),
                ),
              ],
            );
          } else {
            return Container();
          }
        }),
        const SizedBox(height: 30),
        Obx(() {
          if (controller.loadingAnalysis.value == true) {
            return const CircularProgressIndicator();
          } else if (controller.loadingAnalysis.value == false && controller.seeAnalysis.value == true) {
            return ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  items[index].isExpanded = isExpanded;
                });
              },
              children: items.map<ExpansionPanel>((Item item) {
                return ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text(item.headerValue),
                    );
                  },
                  body: item.body,
                  isExpanded: item.isExpanded,
                );
              }).toList(),
            );
          } else {
            return Container();
          }
        }),
      ],
    );
  }
}

class Item {
  String headerValue;
  Widget body;
  bool isExpanded;

  Item({
    required this.headerValue,
    required this.body,
    this.isExpanded = false,
  });
}

