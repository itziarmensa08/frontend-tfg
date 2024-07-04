

import 'package:flutter/material.dart';
import 'package:frontend_tfg/pages/new_analysis/new_analysis.controller.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/first_segment_first.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/second_segment_first.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/third_segment_first.dart';
import 'package:get/get.dart';

class SecondStep extends StatefulWidget {
  const SecondStep({super.key, required this.controller});

  final NewAnalaysisController controller;

  @override
  State<SecondStep> createState() =>
      SecondStepState();
}

class SecondStepState extends State<SecondStep> {

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (widget.controller.indexStepper.value == 1 && widget.controller.loadingAnalysisN.value == false && widget.controller.itemsNMotors.isNotEmpty) {
        return SingleChildScrollView(
          child: Container(
            child: _buildPanel(),
          ),
        );
      } else {
        return const LinearProgressIndicator();
      }
    });
  }

  Widget _buildPanel() {
    return Obx(() => ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          widget.controller.itemsNMotors[index].isExpanded = isExpanded;
        });
      },
      children: widget.controller.itemsNMotors.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: item.body,
          isExpanded: item.isExpanded,
        );
      }).toList()),
    );
  }
}
