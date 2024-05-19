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
        height: MediaQuery.of(context).size.height * 1.2, // Increase height for more elongated lines
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: SfCartesianChart(
                primaryXAxis: NumericAxis(
                  title: const AxisTitle(text: 'REFERENCE LINE', alignment: ChartAlignment.far),
                  minimum: widget.rateGraphic?.axis?.x?[0].toDouble() ?? 0.0,
                  maximum: widget.rateGraphic?.axis?.x?[widget.rateGraphic!.axis!.x!.length - 1].toDouble() ?? 0.0,
                  majorGridLines: MajorGridLines(
                    width: 2,
                    color: Colors.grey,
                  ),
                  minorGridLines: MinorGridLines(
                    width: 1,
                    color: Colors.grey,
                  ),
                  minorTicksPerInterval: 10,
                ),
                primaryYAxis: NumericAxis(
                  title: const AxisTitle(text: 'OAT (ºC)'),
                  interval: 10,
                  minimum: widget.rateGraphic?.axis?.y?[7].toDouble() ?? 0.0,
                  maximum: widget.rateGraphic?.axis?.y?[widget.rateGraphic!.axis!.y!.length - 1].toDouble() ?? 0.0,
                  majorGridLines: MajorGridLines(
                    width: 2,
                    color: Colors.grey,
                  ),
                  minorGridLines: MinorGridLines(
                    width: 1,
                    color: Colors.grey,
                  ),
                  minorTicksPerInterval: 10,
                ),
                series: buildSecondSeries(),
                annotations: buildAnnotations(),
              ),
            ),
            Expanded(
              flex: 4,
              child: SfCartesianChart(
                primaryXAxis: NumericAxis(
                  title: const AxisTitle(text: 'RATE OF CLIMB (FEET PER MINUTE)'),
                  minimum: widget.rateGraphic?.axis?.x?[0].toDouble() ?? 0.0,
                  maximum: widget.rateGraphic?.axis?.x?[widget.rateGraphic!.axis!.x!.length - 1].toDouble() ?? 0.0,
                  majorGridLines: MajorGridLines(
                    width: 2,
                    color: Colors.grey,
                  ),
                  minorGridLines: MinorGridLines(
                    width: 1,
                    color: Colors.grey,
                  ),
                  minorTicksPerInterval: 10,
                ),
                primaryYAxis: NumericAxis(
                  title: const AxisTitle(text: 'GROSS WEIGHT (1,000 POUNDS)'),
                  interval: 1,
                  minimum: widget.rateGraphic?.axis?.y?[0].toDouble() ?? 0.0,
                  maximum: widget.rateGraphic?.axis?.y?[6].toDouble() ?? 0.0,
                  majorGridLines: MajorGridLines(
                    width: 2,
                    color: Colors.grey,
                  ),
                  minorGridLines: MinorGridLines(
                    width: 1,
                    color: Colors.grey,
                  ),
                  minorTicksPerInterval: 10,
                ),
                series: buildFirstSeries(),
              ),
            ),
          ],
        ),
      ),
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
            yValueMapper: (ReferenceLine data, _) => data.y,
            color: Colors.black,
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
              color: Colors.black,
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
              color: Colors.black,
            ),
          );
        }
      }
    }

    return seriesList;
  }

  List<CartesianChartAnnotation> buildAnnotations() {
    List<CartesianChartAnnotation> annotations = [];
    if (widget.rateGraphic != null) {
      if (widget.rateGraphic!.pressureLines != null) {
        for (var pressureLine in widget.rateGraphic!.pressureLines!) {
          if (pressureLine.altitud != null && pressureLine.points!.length > 1) {
            // Calculate the midpoint between the first two points
            var firstPoint = pressureLine.points![0];
            var secondPoint = pressureLine.points![1];
            var midPointX = (firstPoint.x! + secondPoint.x!) / 2;
            var midPointY = (firstPoint.y! + secondPoint.y!) / 2;
            annotations.add(
              CartesianChartAnnotation(
                widget: Opacity(
                  opacity: 0.7,
                  child: Container(
                    color: Colors.white.withOpacity(0.7),
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      '${pressureLine.altitud}',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                coordinateUnit: CoordinateUnit.point,
                x: midPointX,
                y: midPointY + 3, // Adjust y position to be slightly above the midpoint
              ),
            );
          }
        }
      }
      annotations.add(
        CartesianChartAnnotation(
          widget: Container(
            color: Colors.white.withOpacity(0.7),
            padding: EdgeInsets.all(4.0),
            child: Text(
              'PRESSURE ALTITUDE (FEET)',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          coordinateUnit: CoordinateUnit.logicalPixel,
          region: AnnotationRegion.chart,
          x: MediaQuery.of(context).size.width * 0.3, // Adjust the x position
          y: MediaQuery.of(context).size.height * 0.1, // Adjust the y position
        ),
      );
    }
    return annotations;
  }
}
