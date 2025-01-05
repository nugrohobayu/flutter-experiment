import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  final String category;
  final double value;
  final Color color;

  ChartData(this.category, this.value, this.color);
}

class ChartScreen extends StatelessWidget {
  const ChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Category A', 40, Colors.blue),
      ChartData('Category B', 30, Colors.green),
      ChartData('Category C', 20, Colors.orange),
      ChartData('Category D', 10, Colors.red),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Chart Screen"),
      ),
      body: Center(
        child: SfCircularChart(
          title: ChartTitle(text: 'Doughnut Chart Example'),
          legend: Legend(isVisible: true),
          series: <DoughnutSeries<ChartData, String>>[
            DoughnutSeries<ChartData, String>(
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.category,
              yValueMapper: (ChartData data, _) => data.value,
              pointColorMapper: (ChartData data, _) => data.color,
              dataLabelSettings: DataLabelSettings(isVisible: true),
              innerRadius: '50%',
              dataLabelMapper: (datum, index) => '${datum.value} %',
            ),
          ],
        ),
      ),
    );
  }
}
