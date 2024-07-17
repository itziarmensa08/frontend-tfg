import 'package:flutter/material.dart';
import 'package:frontend_tfg/data/models/gradientgraphic.model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GradientChart extends StatefulWidget {
  const GradientChart({super.key, required this.gradientGraphic, required this.resultRate});

  final GradientGraphic? gradientGraphic;
  final Map<String, dynamic>? resultRate;

  @override
  State<GradientChart> createState() => _GradientChartState();
}

class _GradientChartState extends State<GradientChart> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          children: [
            Expanded(
              child: SfCartesianChart(
                primaryXAxis: NumericAxis(
                  title: const AxisTitle(text: 'HORIZONTAL DISTANCE FROM 35 FOOT HEIGHT POINT (NM)'),
                  minimum: widget.gradientGraphic?.axis?.x?[0].toDouble() ?? 0.0,
                  maximum: widget.gradientGraphic?.axis?.x?[widget.gradientGraphic!.axis!.x!.length - 1].toDouble() ?? 0.0,
                  majorGridLines: const MajorGridLines(
                    width: 2,
                    color: Colors.grey,
                  ),
                  minorGridLines: const MinorGridLines(
                    width: 1,
                    color: Colors.grey,
                  ),
                  minorTicksPerInterval: 10,
                ),
                primaryYAxis: NumericAxis(
                  title: const AxisTitle(text: 'OBSTACLE HEIGHT ABOVE RUNWAY (FEET)'),
                  interval: 50,
                  minimum: widget.gradientGraphic?.axis?.y?[0].toDouble() ?? 0.0,
                  maximum: widget.gradientGraphic?.axis?.y?[widget.gradientGraphic!.axis!.y!.length - 1].toDouble() ?? 0.0,
                  majorGridLines: const MajorGridLines(
                    width: 2,
                    color: Colors.grey,
                  ),
                  minorGridLines: const MinorGridLines(
                    width: 1,
                    color: Colors.grey,
                  ),
                  minorTicksPerInterval: 10,
                ),
                series: buildSecondSeries(),
                annotations: buildAnnotations(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<CartesianSeries> buildSecondSeries() {
    List<CartesianSeries> seriesList = [];
    if (widget.gradientGraphic != null) {
      if (widget.gradientGraphic!.gradientLines != null) {
        for (var gradientLine in widget.gradientGraphic!.gradientLines!) {
          seriesList.add(
            LineSeries<GradientLinesPoints, double>(
              dataSource: gradientLine.points,
              xValueMapper: (GradientLinesPoints data, _) => data.x,
              yValueMapper: (GradientLinesPoints data, _) => data.y,
              color: Colors.black,
            ),
          );
        }
      }
    }

    if (widget.resultRate!.isNotEmpty) {
      List<Map<String, double>> mainPoints = [
        {"x": widget.resultRate!["firstPoint"]["x"], "y": widget.resultRate!["firstPoint"]["y"]},
        {"x": widget.resultRate!["secondPoint"]["x"], "y": widget.resultRate!["secondPoint"]["y"]},
        {"x": widget.resultRate!["thirdPoint"]["x"], "y": widget.resultRate!["thirdPoint"]["y"]}
      ];

      seriesList.add(
        LineSeries<Map<String, double>, double>(
          dataSource: mainPoints,
          xValueMapper: (Map<String, double> data, _) => data['x'],
          yValueMapper: (Map<String, double> data, _) => data['y'],
          color: Colors.red,
        ),
      );
    }

    return seriesList;
  }

  List<CartesianChartAnnotation> buildAnnotations() {
    List<CartesianChartAnnotation> annotations = [];
    if (widget.gradientGraphic != null) {
      if (widget.gradientGraphic!.gradientLines != null) {
        for (var gradientLine in widget.gradientGraphic!.gradientLines!) {
          if (gradientLine.gradient != null && gradientLine.points!.length > 1) {
            var firstPoint = gradientLine.points![0];
            var secondPoint = gradientLine.points![1];
            var midPointX = (firstPoint.x! + secondPoint.x!) / 2;
            var midPointY = (firstPoint.y! + secondPoint.y!) / 2;
            annotations.add(
              CartesianChartAnnotation(
                widget: Opacity(
                  opacity: 0.7,
                  child: Container(
                    color: Colors.white.withOpacity(0.7),
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      '${gradientLine.gradient}',
                      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                coordinateUnit: CoordinateUnit.point,
                x: midPointX,
                y: midPointY + 3,
              ),
            );
          }
        }
      }
    }
    return annotations;
  }
}
