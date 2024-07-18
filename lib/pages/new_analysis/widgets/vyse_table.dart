import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/vytable.model.dart';

class VyseTable extends StatelessWidget {
  const VyseTable({super.key, required this.table, required this.obtainedData});

  final VYTableModel table;
  final List<VYtableRowsPressures> obtainedData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        child: Table(
          columnWidths: _buildColumnWidths(),
          border: TableBorder.all(),
          children: [
            _buildPressureRow(),
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

  TableRow _buildPressureRow() {
    List<int> values = [0, 5000, 10000, 15000, 20000];
    List<Widget> cells = [
      const Text('GROSS WEIGHT (POUNDS)'),
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
          Text('${rowData.grossWeight}')
        ];

        for (var data in rowData.pressures!) {
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
