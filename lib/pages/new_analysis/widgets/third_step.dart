

import 'package:flutter/material.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/first_segment_second.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/second_segment_second.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/third_segment_second.dart';
import 'package:get/get.dart';

class ThirdStep extends StatefulWidget {
  const ThirdStep({super.key});

  @override
  State<ThirdStep> createState() =>
      ThirdStepState();
}

class ThirdStepState extends State<ThirdStep> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
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

List<Item> items = [
  Item(
    headerValue: 'segment1'.tr,
    body: FirstSegmentSecondStep()
  ),
  Item(
    headerValue: 'segment2'.tr,
    body: SecondSegmentSecondStep()
  ),
  Item(
    headerValue: 'segment3'.tr,
    body: ThirdSegmentSecondStep()
  ),
];