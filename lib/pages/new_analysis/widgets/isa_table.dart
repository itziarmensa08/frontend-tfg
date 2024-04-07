import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/isatable.model.dart';

class ISATable extends StatelessWidget {
  const ISATable({super.key, required this.table, required this.obtainedData});

  final ISATableModel table;
  final List<ISATableData> obtainedData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        child: Table(
          columnWidths: _buildColumnWidths(),
          border: TableBorder.all(),
          children: [
            ..._buildTitles(),
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

    for (int i = 0; i < 9; i++) {
      columnWidths[i] = const FixedColumnWidth(100.0);
    }

    return columnWidths;
  }

  List<TableRow> _buildTitles() {
    List<Widget> rowWidgets = [
      const Text('ALTITUDE (FEET)', textAlign: TextAlign.center),
      const Text('TEMP. (ºC)', textAlign: TextAlign.center),
      const Text('PRESSURE (hPa)', textAlign: TextAlign.center),
      const Text('PRESSURE (PSI)', textAlign: TextAlign.center),
      const Text('PRESSURE (In.Hg)', textAlign: TextAlign.center),
      const Text('PRESSURE RATIO (δ = P/P0)', textAlign: TextAlign.center),
      const Text('DENSITY (σ = ρ/ρ0)', textAlign: TextAlign.center),
      const Text('SPEED OF SOUND (kt)', textAlign: TextAlign.center),
      const Text('ALTITUDE (meters)', textAlign: TextAlign.center),
    ];

    List<TableRow> rows = [TableRow(children: rowWidgets)];
    return rows;
  }

  List<TableRow> buildTableRowsData() {
    List<TableRow> rows = [];
    if (table.data != null) {
      for (var rowData in table.data!) {
        if (rowData.pressure != null) {
          List<Widget> rowWidgets = [
            Text('${rowData.altitudeFeet}'),
            Text('${rowData.temperature}'),
            Text('${rowData.pressure!.hPa}'),
            Text('${rowData.pressure!.PSI}'),
            Text('${rowData.pressure!.InHg}'),
            Text('${rowData.pressureRatio}'),
            Text('${rowData.density}'),
            Text('${rowData.speedSound}'),
            Text('${rowData.altitudeMeters}'),
          ];

          rows.add(TableRow(children: rowWidgets));
        }
      }
    }
    return rows;
  }

}
