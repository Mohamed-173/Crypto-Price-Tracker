// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  Chart({
    Key? key,
    this.listattribute = 0,
  }) : super(key: key);
  final double listattribute;
  final List<FlSpot> datas = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        width: 800,
        height: 320,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: AspectRatio(
          aspectRatio: 1.7,
          child: LineChart(
            LineChartData(
              gridData: const FlGridData(show: false),
              titlesData: const FlTitlesData(
                show: true,
                // rightTitles: AxisTitles(axisNameSize: 10),
                leftTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              borderData: FlBorderData(show: true, border: Border.all()),
              lineBarsData: [
                LineChartBarData(
                  spots: _generateData("1Y"),
                  isCurved: true,
                  color: Colors.black.withOpacity(0.5),
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(show: false),
                ),
                // LineChartBarData(
                //   spots: _generateData("1Y"),
                //   isCurved: true,
                //   color: Colors.red.withOpacity(0.5),
                //   dotData: const FlDotData(show: false),
                //   belowBarData: BarAreaData(show: false),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<FlSpot> _generateData(
    String interval,
  ) {
    // Generate simulated data based on interval
    switch (interval) {
      case '1Y':
        return _generateRandomData();
      case '1M':
        return [
          const FlSpot(1, 50),
          const FlSpot(2, 75),
          // Add more data points for 1 month
        ];
      case '1W':
        return [
          const FlSpot(1, 25),
          const FlSpot(2, 35),
          // Add more data points for 1 week
        ];
      case '1D':
        return [
          const FlSpot(1, 10),
          const FlSpot(2, 12),
          // Add more data points for 1 day
        ];
      default:
        return [];
    }
  }

// and this
  List<FlSpot> _generateRandomData() {
    datas.add(FlSpot(datas.length + 1, listattribute));
    datas.add(FlSpot(datas.length + 1, 69745));
    datas.add(FlSpot(datas.length + 1, 69740));
    // print(datas.length);

    return datas;
  }
}
