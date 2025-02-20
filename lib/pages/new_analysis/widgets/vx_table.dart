import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/vxtable.model.dart';

class VxTable extends StatelessWidget {
  const VxTable({super.key, required this.table, required this.obtainedData});

  final VXTableModel table;
  final List<VXtableRowsWeights> obtainedData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        child: Table(
          columnWidths: _buildColumnWidths(),
          border: TableBorder.all(),
          children: [
            _buildWeights(),
            ...buildTableRowsData()
          ].map((row) {
            return TableRow(
              children: row.children.map((cell) {
                return TableCell(
                  child: Center(
                    child: cell,
                  ),
                );
              }).toList(),
            );
          }).toList(),
        ),
      ),
    );
  }

  Map<int, TableColumnWidth> _buildColumnWidths() {
    Map<int, TableColumnWidth> columnWidths = {};

    for (int i = 0; i < 10; i++) {
      columnWidths[i] = const FixedColumnWidth(100.0);
    }

    return columnWidths;
  }

  TableRow _buildWeights() {
    List<int> values = [8500, 10500, 12500];
    List<Widget> cells = [
      const Text('PRESSURE ALTITUDE (FEET)'),
    ];

    for (int value in values) {
      cells.add(Text('$value'));
    }

    return TableRow(children: cells);
  }

  List<TableRow> buildTableRowsData() {
    List<TableRow> rows = [];
    if (table.rows != null) {
      for (var rowData in table.rows!) {
        List<Widget> rowWidgets = [
          Text('${rowData.pressure}')
        ];

        for (var data in rowData.weights!) {
          bool isObtained = obtainedData.any((obtained) => obtained.id == data.id);
          Color textColor = isObtained ? Colors.red : Colors.black;

          rowWidgets.add(
            Text(
              '${data.velocityValue}',
              style: TextStyle(color: textColor),
            ),
          );
        }

        rows.add(TableRow(children: rowWidgets));
      }
    }
    return rows;
  }

}
