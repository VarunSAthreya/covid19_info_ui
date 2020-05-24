import 'package:covid19_info_ui/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeeklyChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: BarChart(BarChartData(
        barGroups: getBarGroups(),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          leftTitles: SideTitles(showTitles: false),
          bottomTitles: SideTitles(
            showTitles: true,
            getTitles: getWeek,
            textStyle: TextStyle(
              color: Color(0xFF7589A2),
              fontSize: 10,
              fontWeight: FontWeight.w300,
            )
          )
        ),
      ),
      ),
    );
  }
}

getBarGroups() {
  List<double> barChartDatas = [6, 10, 8, 7, 10, 15, 9];
  List<BarChartGroupData> barChartGroup = [];
  barChartDatas.asMap().forEach(
        (key, value) => barChartGroup.add(
          BarChartGroupData(
            x: key,
            barRods: [
              BarChartRodData(
                y: value,
                color: key == 4 ? kPrimaryColor : kInactiveColor,
                width: 16,
              )
            ],
          ),
        ),
      );
  return barChartGroup;
}

String getWeek(double values){
  switch (values.toInt()){
    case 0:
      return 'MON';
    case 1:
      return 'TUE';
    case 2:
      return 'WED';
    case 3:
      return 'THU';
    case 4:
      return 'FRI';
    case 5:
      return 'SAT';
    case 6:
      return 'SUN';
    default:
      return '';
  }
}