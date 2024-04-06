import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/v2table.model.dart';

class SpeedTable extends StatelessWidget {
  const SpeedTable({super.key, required this.table, required this.obtainedData});

  final V2TableModel table;
  final List<V2TableRowData> obtainedData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        child: Table(
          columnWidths: _buildColumnWidths(),
          border: TableBorder.all(),
          children: [
            _buildTemperaturesRow(),
            ..._buildVelocities(),
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

    columnWidths[0] = const FixedColumnWidth(70.0);
    columnWidths[1] = const FixedColumnWidth(70.0);

    for (int i = 2; i < 30; i++) {
      columnWidths[i] = const FixedColumnWidth(40.0);
    }

    return columnWidths;
  }

  List<TableRow> _buildVelocities() {
    List<Widget> rowWidgets = [
      Text('PRESS ALT (FT)'),
      Text('GROSS WT (LBS)'),
    ];

    for (int i = 0; i < 7; i++) {
      rowWidgets.addAll([
        Text('V1'),
        Text('VR'),
        Text('V2'),
        Text('V50'),
      ]);
    }

    List<TableRow> rows = [TableRow(children: rowWidgets)];
    return rows;
  }

  TableRow _buildTemperaturesRow() {
    List<int> values = [-30, -10, 0, 10, 20, 40, 55];
    List<Widget> cells = [
      SizedBox(),
      SizedBox(),
    ];

    for (int value in values) {
      for (int i = 0; i < 4; i++) {
        cells.add(Text('$value'));
      }
    }

    return TableRow(children: cells);
  }

  List<TableRow> buildTableRowsData() {
    List<TableRow> rows = [];
    for (var rowData in table.rows!) {
      List<Widget> rowWidgets = [
        Text('${rowData.pressure}'),
        Text('${rowData.weight}'),
      ];

      for (var data in rowData.data!) {
        bool isObtained = obtainedData.any((obtained) => obtained.id == data.id);
        Color textColor = isObtained ? Colors.red : Colors.black;

        rowWidgets.add(
          Text(
            '${data.velocityValue}',
            style: TextStyle(color: textColor),
          ),
        );
      }

      while (rowWidgets.length < 30) {
        rowWidgets.add(SizedBox());
      }

      rows.add(TableRow(children: rowWidgets));
    }
    return rows;
  }

}
