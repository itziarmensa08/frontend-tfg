

import 'package:flutter/material.dart';
import 'package:frontend_tfg/pages/new_analysis/widgets/first_segment_first.dart';
import 'package:get/get.dart';

class SecondStep extends StatefulWidget {
  const SecondStep({super.key});

  @override
  State<SecondStep> createState() =>
      SecondStepState();
}

class SecondStepState extends State<SecondStep> {

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
    body: FirstSegmentFirstStep()
  ),
  Item(
    headerValue: 'segment2'.tr,
    body: FirstSegmentFirstStep()
  ),
  Item(
    headerValue: 'segment3'.tr,
    body: FirstSegmentFirstStep()
  ),
];