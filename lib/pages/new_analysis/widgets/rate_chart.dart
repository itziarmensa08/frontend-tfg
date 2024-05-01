import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/rateofclimbgraphic.model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RateChart extends StatefulWidget {
  const RateChart({super.key, required this.rateGraphic});

  final RateOfClimbGraphic? rateGraphic;

  @override
  State<RateChart> createState() => _RateChartState();
}

class _RateChartState extends State<RateChart> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Column(
          children: [
            SfCartesianChart(
              primaryXAxis: NumericAxis(
                isVisible: false,
                title: const AxisTitle(text: 'RATE OF CLIMB (FEET PER MINUTE)'),
                minimum: widget.rateGraphic!.axis!.x![0].toDouble(),
                maximum: widget.rateGraphic!.axis!.x![widget.rateGraphic!.axis!.x!.length - 1].toDouble(),
                majorGridLines: MajorGridLines(
                    width: 0,
                    color: Colors.red,
                    dashArray: <double>[5,5]
                ),
                minorGridLines: MinorGridLines(
                    width: 0,
                    color: Colors.green,
                    dashArray: <double>[5,5]
                ),
              ),
              primaryYAxis: NumericAxis(
                title: const AxisTitle(text: 'OAT (ºC)'),
                interval: 10,
                minimum: widget.rateGraphic!.axis!.y![7].toDouble(),
                maximum: widget.rateGraphic!.axis!.y![widget.rateGraphic!.axis!.y!.length - 1].toDouble(),
                majorGridLines: MajorGridLines(
                    width: 0,
                    color: Colors.red,
                    dashArray: <double>[5,5]
                ),
                minorGridLines: MinorGridLines(
                    width: 0,
                    color: Colors.green,
                    dashArray: <double>[5,5]
                ),
              ),
              series: buildSecondSeries()
            ),
            SfCartesianChart(
              primaryXAxis: NumericAxis(
                title: const AxisTitle(text: 'GROSS WEIGHT (1,000 POUNDS)'),
                minimum: widget.rateGraphic!.axis!.x![0].toDouble(),
                maximum: widget.rateGraphic!.axis!.x![widget.rateGraphic!.axis!.x!.length - 1].toDouble(),
                majorGridLines: MajorGridLines(
                    width: 0,
                    color: Colors.red,
                    dashArray: <double>[5,5]
                ),
                minorGridLines: MinorGridLines(
                    width: 0,
                    color: Colors.green,
                    dashArray: <double>[5,5]
                ),
              ),
              primaryYAxis: NumericAxis(
                title: const AxisTitle(text: 'Eje Y'),
                interval: 1,
                minimum: widget.rateGraphic!.axis!.y![0].toDouble(),
                maximum: widget.rateGraphic!.axis!.y![6].toDouble(),
                majorGridLines: MajorGridLines(
                    width: 0,
                    color: Colors.red,
                    dashArray: <double>[5,5]
                ),
                minorGridLines: MinorGridLines(
                    width: 0,
                    color: Colors.green,
                    dashArray: <double>[5,5]
                ),
              ),
              series: buildFirstSeries()
            ),
          ],
        ),
      )
    );
  }

  List<CartesianSeries> buildFirstSeries() {
    List<CartesianSeries> seriesList = [];
    if (widget.rateGraphic != null) {
      if (widget.rateGraphic!.referenceLine != null) {
        seriesList.add(
          LineSeries<ReferenceLine, int>(
            dataSource: widget.rateGraphic!.referenceLine,
            xValueMapper: (ReferenceLine data, _) => data.x,
            yValueMapper: (ReferenceLine data, _) => data.y
          ),
        );
      }

      if (widget.rateGraphic!.weightLines != null) {
        for (var weightLine in widget.rateGraphic!.weightLines!) {
          seriesList.add(
            LineSeries<WeightLinesPoints, int>(
              dataSource: weightLine.points,
              xValueMapper: (WeightLinesPoints data, _) => data.x,
              yValueMapper: (WeightLinesPoints data, _) => data.y,
            ),
          );
        }
      }
    }

    return seriesList;
  }
  List<CartesianSeries> buildSecondSeries() {
    List<CartesianSeries> seriesList = [];
    if (widget.rateGraphic != null) {
      if (widget.rateGraphic!.pressureLines != null) {
        for (var pressureLine in widget.rateGraphic!.pressureLines!) {
          seriesList.add(
            LineSeries<PressureLinesPoints, int>(
              dataSource: pressureLine.points,
              xValueMapper: (PressureLinesPoints data, _) => data.x,
              yValueMapper: (PressureLinesPoints data, _) => data.y,
            ),
          );
        }
      }
    }

    return seriesList;
  }
}

