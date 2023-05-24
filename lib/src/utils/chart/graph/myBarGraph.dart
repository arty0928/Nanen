import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nanen/src/constants/colors.dart';
import 'package:nanen/src/features/user/mypage/widget/mypageChart.dart';

class MyBarGraph extends StatelessWidget {
  final List weeklySummary;
  const MyBarGraph({super.key, required this.weeklySummary});

  @override
  Widget build(BuildContext context) {
    //initialize bar data
    BarData myBarData = BarData(
      active: weeklySummary[0],
      calm: weeklySummary[1],
      creative: weeklySummary[2],
      people: weeklySummary[3],
    );

    myBarData.initializeBarData();

    return BarChart(BarChartData(
      backgroundColor: Colors.grey.withOpacity(0.1),
      maxY: 100,
      minY: 0,
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
        show: true,
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getBottomTitles,
          ),
        ),
      ),
      barGroups: myBarData.barData
          .map(
            (data) => BarChartGroupData(x: data.x, barRods: [
              BarChartRodData(
                toY: data.y,
                color: tSeconddaryColor,
                width: 35,
                borderRadius: BorderRadius.circular(4),
                backDrawRodData: BackgroundBarChartRodData(
                    show: true, toY: 100, color: tWhiteColor),
              ),
            ]),
          )
          .toList(),
    ));
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style =
      TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14);

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text(
        'A',
        style: style,
      );
      break;
    case 1:
      text = const Text(
        'C',
        style: style,
      );
      break;
    case 2:
      text = const Text(
        'C',
        style: style,
      );
      break;
    case 3:
      text = const Text(
        'P',
        style: style,
      );
      break;

    default:
      text = const Text(
        '',
        style: style,
      );
      break;
  }
  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}
