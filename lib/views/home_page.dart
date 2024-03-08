// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import 'package:crypto_price_tracker/common/constant/app_color.dart';
import 'package:crypto_price_tracker/common/constant/component_parts.dart';
import 'package:crypto_price_tracker/common/responsive/responsive.dart';

import 'components/component_barrel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              color: MyColorClass.backgroundColor,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LogoAndName(
                    path: "assets/icons/logo.svg",
                    title: "Crypto Tracker",
                    size: 30,
                  ),
                  ListBotton(
                    listOfAttrebute: componentList,
                  ),
                ],
              ),
            ),
          ),
          Divider(
            indent: 10,
            endIndent: 10,
            color: MyColorClass.textColorPrimary.withOpacity(0.3),
          ),
          Expanded(
            flex: 10,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Responsive.isMobile(context) ? 25 : 50.w),
              color: MyColorClass.primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PageTitle(title: "Dashboard"),
                  Container(
                    width: 400,
                    height: 400,
                    child: AspectRatio(
                      aspectRatio: 1.5,
                      child: LineChart(
                        LineChartData(
                          gridData: FlGridData(show: false),
                          titlesData: FlTitlesData(show: false),
                          borderData: FlBorderData(show: false),
                          lineBarsData: [
                            LineChartBarData(
                              spots: _generateData("1Y"),
                              isCurved: true,
                              color: Colors.blue,
                              dotData: FlDotData(show: false),
                              belowBarData: BarAreaData(show: false),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
    ;
  }
}

List<FlSpot> _generateData(String interval) {
  // Generate simulated data based on interval
  switch (interval) {
    case '1Y':
      return [
        FlSpot(1, 100),
        FlSpot(2, 150),
        // Add more data points for 1 year
      ];
    case '1M':
      return [
        FlSpot(1, 50),
        FlSpot(2, 75),
        // Add more data points for 1 month
      ];
    case '1W':
      return [
        FlSpot(1, 25),
        FlSpot(2, 35),
        // Add more data points for 1 week
      ];
    case '1D':
      return [
        FlSpot(1, 10),
        FlSpot(2, 12),
        // Add more data points for 1 day
      ];
    default:
      return [];
  }
}
