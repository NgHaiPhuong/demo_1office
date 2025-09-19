
import 'package:demo_1office/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../features/data/models/salary_data.dart';

class ChartWidget extends StatelessWidget {
  final List<SalaryData> dataSalary;

  const ChartWidget({super.key, required this.dataSalary,});

  @override
  Widget build(BuildContext context) {

    final availableHeight = MediaQuery.of(context).size.height
        - kToolbarHeight
        - kBottomNavigationBarHeight
        - kTextTabBarHeight
        - MediaQuery.of(context).padding.top
        - MediaQuery.of(context).padding.bottom - 170;

    return Container(
      height: availableHeight,
      color: Colors.white,
      padding: const EdgeInsets.all(8.0),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(
          interval: 1,
          labelRotation: -70,
          labelStyle: const TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),
          axisLine: const AxisLine(width: 0),
          majorGridLines: const MajorGridLines(width: 0),
        ),
        primaryYAxis: NumericAxis(
            minimum: 0,
            maximum: dataSalary.map((e) => (Utils().convertToMillion(e.salary))).reduce((a, b) => a > b ? a : b) + 1,
            interval: 1,
            numberFormat: NumberFormat.compact(), // hiển thị 1M, 2M...
            labelFormat: '{value}M',
            axisLine: const AxisLine(width: 0),
            majorGridLines: const MajorGridLines(width: 1)
        ),
        tooltipBehavior: TooltipBehavior(
          enable: true,
          color: Colors.grey.shade100,
          builder: (dynamic data, dynamic point, dynamic series, int pointIndex, int seriesIndex) {
            final SalaryData salary = data as SalaryData;
            return Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.lightGreen, width: 1),
                boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4)],
              ),
              child: _buildDetail(salary),
            );
          },
        ),
        series: <CartesianSeries<SalaryData, String>>[
          LineSeries<SalaryData, String>(
            width: 4,
            color: Colors.lightGreen.withValues(alpha: 0.8),
            dataSource: dataSalary,
            xValueMapper: (SalaryData sales, _) => sales.month,
            yValueMapper: (SalaryData sales, _) => Utils().convertToMillion(sales.salary),
            name: 'Lương',
            dataLabelSettings: const DataLabelSettings(isVisible: false),
            markerSettings: const MarkerSettings(isVisible: true, color: Colors.lightGreen, width: 9),
          ),
          ColumnSeries<SalaryData, String>(
            dataSource: dataSalary,
            xValueMapper: (SalaryData s, _) => s.month,
            yValueMapper: (SalaryData s, _) => Utils().convertToMillion(s.salary),
            pointColorMapper: (SalaryData s, _) {
              final now = DateTime.now();
              final currentMonth = now.month - 1; // giả sử s.month = "9", "10", ...

              if (s.month == ("Tháng $currentMonth")) {
                return Colors.lightGreen.withValues(alpha: 0.15);
              }
              return Colors.transparent;
            },
            width: 0.6,
            name: "Tháng hiện tại",
          ),
        ],
      ),
    );
  }

  Widget _buildDetail(SalaryData salary) {
    return IntrinsicWidth(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            salary.month,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.circle, size: 16, color: Colors.lightGreen),
              SizedBox(width: 6),
              Text(
                'Lương tháng : ${Utils().formatMoney(salary.salary)}',
                style: const TextStyle(color: Colors.black),
              ),
            ],
          )
        ],
      ),
    );
  }
}