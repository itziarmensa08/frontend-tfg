import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/v2table.moel.dart';

class SpeedTable extends StatelessWidget {
  const SpeedTable({super.key, required this.table});

  final V2TableModel table;

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        child: Table(
          columnWidths: const <int, TableColumnWidth>{
            0: FixedColumnWidth(100.0),
            1: FixedColumnWidth(100.0),
            3: FixedColumnWidth(100.0),
            4: FixedColumnWidth(100.0), // example width
            // Define other column widths
          },
          border: TableBorder.all(),
          children: List<TableRow>.generate(table.rows!.length, (index) {
            List<Widget> rowWidgets = [
              Text('${table.rows![index].pressure}'),
              Text('${table.rows![index].weight}'),
            ];

            // Adding Text widgets for each column
            for (var data in table.rows![index].data!) {
              rowWidgets.add(
                Text('${data.velocityValue}'),
              );
            }

            return TableRow(
              children: rowWidgets,
            );
          }),
        )
        /*child: DataTable(
          columns: const [
            DataColumn(label: Text('Pressure altitud')),
            DataColumn(label: Text('Gross weight')),
            DataColumn(label: Text('Outside Air Temperature')),
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('')),
              DataCell(Text('')),
              DataCell(Text('-30')),
              DataCell(Text('-30')),
              DataCell(Text('-30')),
              DataCell(Text('-30')),
              DataCell(Text('-10')),
              DataCell(Text('-10')),
              DataCell(Text('-10')),
              DataCell(Text('-10')),
              DataCell(Text('0')),
              DataCell(Text('0')),
              DataCell(Text('0')),
              DataCell(Text('0')),
              DataCell(Text('10')),
              DataCell(Text('10')),
              DataCell(Text('10')),
              DataCell(Text('10')),
              DataCell(Text('20')),
              DataCell(Text('20')),
              DataCell(Text('20')),
              DataCell(Text('20')),
              DataCell(Text('40')),
              DataCell(Text('40')),
              DataCell(Text('40')),
              DataCell(Text('40')),
              DataCell(Text('55')),
              DataCell(Text('55')),
              DataCell(Text('55')),
              DataCell(Text('55')),
            ]),
            DataRow(cells: [
              DataCell(Text('')),
              DataCell(Text('')),
              DataCell(Text('V1')),
              DataCell(Text('VR')),
              DataCell(Text('V2')),
              DataCell(Text('V50')),
              DataCell(Text('V1')),
              DataCell(Text('VR')),
              DataCell(Text('V2')),
              DataCell(Text('V50')),
              DataCell(Text('V1')),
              DataCell(Text('VR')),
              DataCell(Text('V2')),
              DataCell(Text('V50')),
              DataCell(Text('V1')),
              DataCell(Text('VR')),
              DataCell(Text('V2')),
              DataCell(Text('V50')),
              DataCell(Text('V1')),
              DataCell(Text('VR')),
              DataCell(Text('V2')),
              DataCell(Text('V50')),
              DataCell(Text('V1')),
              DataCell(Text('VR')),
              DataCell(Text('V2')),
              DataCell(Text('V50')),
              DataCell(Text('V1')),
              DataCell(Text('VR')),
              DataCell(Text('V2')),
              DataCell(Text('V50')),
            ]),
            DataRow(cells: [
              DataCell(Text('0')),
              DataCell(Text('16000')),
              ... table.data!.map((item) {
                return
                  DataCell(Text((item.velocityName == 'V1' && item.temperature.toString() == '-30') ? item.velocityValue.toString() : ''));
              }),
              ... table.data!.map((item) {
                return
                  DataCell(Text((item.velocityName == 'VR' && item.temperature.toString() == '-30') ? item.velocityValue.toString() : ''));
              }),
              ... table.data!.map((item) {
                return
                  DataCell(Text((item.velocityName == 'V2' && item.temperature.toString() == '-30') ? item.velocityValue.toString() : ''));
              }),
            ]),
          ],
          /*columns: [
            DataColumn(label: Text('Pressure Altitude')),
            DataColumn(label: Text('Gross Weight')),
          ],
          rows: table.data!.map((item) {
            return DataRow(cells: [
              DataCell(Text(item.pressure.toString())),
              DataCell(Text(item.weight.toString())),
            ]);
          }).toList(),*/
        ),*/
      ),
    );
  }
}