import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/services/isatable.service.dart';
import 'package:frontend_tfg/data/services/rateofclimbgraphic.service.dart';
import 'package:frontend_tfg/data/services/v2table.service.dart';
import 'package:frontend_tfg/pages/new_analysis/new_analysis.controller.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/first_segment_second.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/second_segment_second.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/third_segment_second.dart';
import 'package:get/get.dart';

class ThirdStep extends StatefulWidget {
  const ThirdStep({super.key, required this.controller});

  final NewAnalaysisController controller;

  @override
  State<ThirdStep> createState() => ThirdStepState();
}

class ThirdStepState extends State<ThirdStep> {
  List<Item> items = [];

  void generateItems(bool reachDP1, bool reachDP2, bool reachDP3) {
    setState(() {
      items = [
        if (double.parse(widget.controller.initialElevation.text) < 400)
          Item(
            headerValue: 'segment1'.tr,
            body: FirstSegmentSecondStep(),
          ),
        if (double.parse(widget.controller.initialElevation.text) < 400 ||
            (double.parse(widget.controller.initialElevation.text) > 400 && double.parse(widget.controller.initialElevation.text) < 1500))
          Item(
            headerValue: 'segment2'.tr,
            body: SecondSegmentSecondStep(),
          ),
        Item(
          headerValue: 'segment3'.tr,
          body: ThirdSegmentSecondStep(),
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
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () async {
              },
              child: Text('minimum_altitude'.tr),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () async {
              },
              child: Text('minimum_gradient'.tr),
            ),
          ],
        ),
        /*const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () async {
            var reachDP1 = false;
            var reachDP2 = false;
            var reachDP3 = false;
            if (double.parse(widget.controller.initialElevation.text) < 400){
              controller.loadingAnalysis.value = true;
              var resultrateresponseN = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphic.value.id!, controller.selectedAirport.value!.referenceTemperature!, controller.selectedAirport.value!.elevation!, double.parse(controller.weight.text));
              if (resultrateresponseN != null) {
                if (controller.firstSegmentN.value.velocityTAS != null) {
                  controller.failure.value.distanceToInitial = controller.firstSegmentN.value.velocityTAS! * (((controller.failure.value.initialElevation! - 50) / resultrateresponseN['finalPoint']['x'])/60);
                }
              }
              // ----------------------------- 1st SEGMENT -----------------------------
              var obtainedData = await V2TableService.getObtainedData(controller.selectedAircraft.value!.id!, controller.selectedAirport.value!.elevation!, double.parse(controller.weight.text), controller.selectedAirport.value!.referenceTemperature!, "V2");
              if (obtainedData != null) {
                controller.obtainedDataN1.value = obtainedData.dataList;
                controller.velocityFirstSegmentN1.text = obtainedData.velocityValue.toString();
                controller.firstSegmentN1.value.velocityIAS = obtainedData.velocityValue;
              }
              var obtainedDataISA = await ISATableService.getObtainedData(controller.selectedAirport.value!.elevation! + controller.failure.value.initialElevation!);
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
              var rateresponse = await RateOfClimbGraphicService.getRateByAircraft(controller.selectedAircraft.value!.id!, 1);
              if (rateresponse != null) {
                controller.rateGraphicFirstSegmentN1.value = rateresponse;
              }
              var resultrateresponse = await RateOfClimbGraphicService.calculateRateOfClimb(controller.rateGraphic.value.id!, controller.selectedAirport.value!.referenceTemperature!, controller.selectedAirport.value!.elevation! + controller.failure.value.initialElevation!, double.parse(controller.weight.text));
              if (resultrateresponse != null) {
                controller.resultRateFirstSegmentN1.value = resultrateresponse;
                controller.firstSegmentN1.value.rateClimb = resultrateresponse['finalPoint']['x'];
                controller.rateOfClimbFirstSegmentN1.text = resultrateresponse['finalPoint']['x'].toString();
                controller.firstSegmentN1.value.timeToFinish = (400 - 35 - controller.failure.value.initialElevation!) / resultrateresponse['finalPoint']['x']; // minutes
                controller.timeFirstSegmentN1.text = ((400 - 35 - controller.failure.value.initialElevation!) / resultrateresponse['finalPoint']['x']).toString();
                if (controller.firstSegmentN1.value.velocityTAS != null) {
                  controller.firstSegmentN1.value.distanceToFinish = controller.firstSegmentN1.value.velocityTAS! * (((400 - 35 - controller.failure.value.initialElevation!) / resultrateresponse['finalPoint']['x'])/60);
                  controller.distanceFirstSegmentN1.text = (controller.firstSegmentN1.value.velocityTAS! * (((400 - 35 - controller.failure.value.initialElevation!) / resultrateresponse['finalPoint']['x'])/60)).toString();
                }
              }
              if (controller.firstSegmentN1.value.distanceToFinish != null && controller.newProcedure.value.dpDistance != null) {
                if (controller.firstSegmentN1.value.distanceToFinish! < controller.newProcedure.value.dpDistance!) {
                  controller.firstSegmentN1.value.reachDP = false;
                } else {
                  controller.firstSegmentN1.value.reachDP = true;
                  reachDP1 = true;
                  controller.firstSegmentN1.value.timeToDP = (controller.newProcedure.value.dpDistance! - controller.failure.value.distanceToInitial!) / (controller.firstSegmentN1.value.velocityTAS! * 60);
                  controller.timeToDPFirstSegmentN1.text = ((controller.newProcedure.value.dpDistance! - controller.failure.value.distanceToInitial!) / (controller.firstSegmentN1.value.velocityTAS! * 60)).toString();

                  controller.firstSegmentN1.value.altitudeInDP = (controller.firstSegmentN1.value.timeToDP! * controller.firstSegmentN1.value.rateClimb!) + controller.failure.value.initialElevation!;
                  controller.altitudeInDPFirstSegmentN1.text = ((controller.firstSegmentN1.value.timeToDP! * controller.firstSegmentN1.value.rateClimb!) + controller.failure.value.initialElevation!).toString();

                  if ((controller.firstSegmentN1.value.altitudeInDP! + controller.selectedAirport.value!.elevation!) > controller.newProcedure.value.dpAltitude!) {
                    controller.firstSegmentN1.value.clearDP = true;
                  } else {
                    controller.firstSegmentN1.value.clearDP = false;
                  }
                }
              }
              controller.failure.value.firstSegment = controller.firstSegmentN1.value;
            } else if (double.parse(widget.controller.initialElevation.text) < 400 || (double.parse(widget.controller.initialElevation.text) > 400 && double.parse(widget.controller.initialElevation.text) < 1500)) {

            } else {

            }
            generateItems(reachDP1, reachDP2, reachDP3);
            controller.newProcedure.value.failure = controller.failure.value;
            widget.controller.seeAnalysis.value = true;
            controller.loadingAnalysis.value = false;
            print(controller.newProcedure.value.toJson());
          },
          child: Text('start_analysis'.tr),
        ),
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
        }),*/
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
