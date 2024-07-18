import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class fl extends StatelessWidget {
  final bool isOn;
  final bool isWeekSelected;
  final DateTime startDate;

  const fl({
    Key? key,
    required this.isOn,
    required this.isWeekSelected,
    required this.startDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DateTime> dates;
    List<FlSpot> spots;

    if (isWeekSelected) {
      dates = [
        startDate,
        startDate.add(const Duration(days: 1)),
        startDate.add(const Duration(days: 4)),
        startDate.add(const Duration(days: 6)),
      ];
      spots = [
        const FlSpot(0, 0),
        const FlSpot(1, 0),
        const FlSpot(2, 0),
        const FlSpot(3, 0),
      ];
    } else {
      dates = List.generate(4, (index) => startDate.add(Duration(days: 7 * index)));
      spots = List.generate(4, (index) => FlSpot(index.toDouble(), 0));
    }

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          if (isOn)
            const Positioned(
              top: 70,
              left: 23,
              child: Text(
                'Average: 0',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.blue,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              Expanded(
                child: LineChart(
                  LineChartData(
                    gridData: const FlGridData(show: false),
                    titlesData: const FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    lineBarsData: isOn
                        ? [
                            LineChartBarData(
                              spots: spots,
                              isCurved: true,
                              color: Colors.blue,
                              barWidth: 3,
                              isStrokeCapRound: true,
                              belowBarData: BarAreaData(show: false),
                            ),
                          ]
                        : [],
                    minX: -0.2,
                    maxX: 3.2,
                    minY: -4,
                    maxY: 5,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: dates
                    .map((date) => Text(
                          DateFormat('d MMM').format(date),
                          style: const TextStyle(fontSize: 12),
                        ))
                    .toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
