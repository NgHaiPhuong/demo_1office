
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../core/utils/data.dart';
import '../../../../core/utils/detail_salary_widget.dart';
import '../../../../core/utils/header.dart';
import '../../../../core/utils/history_widget.dart';
import '../../../data/models/salary_data.dart';

class SalaryTab extends StatefulWidget {
  const SalaryTab({super.key});

  @override
  State<SalaryTab> createState() => _SalaryTab();
}

class _SalaryTab extends State<SalaryTab> {
  final List<int> salaryByMonth = List.generate(DateTime.now().month, (index) => 0);
  final List<SalaryData> dataSalary = LoadData().dataSalary;
  List<bool> isExpandedList = [true, true];
  bool isShowChart = false;
  OverlayEntry? _overlayEntry;
  final GlobalKey _iconKey = GlobalKey();

  void expandDetailSalary(int index) {
    setState(() {
      isExpandedList[index] = !isExpandedList[index];
    });
  }

  void showChart() {
    setState(() {
      isShowChart = !isShowChart;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitle(
            title: "  Lương thực nhận năm 2025",
            isExpand: isExpandedList[0],
            isMoreIcon: true,
            icon: isShowChart? Icons.list_alt_outlined : Icons.bar_chart,
            onTap: () { expandDetailSalary(0); },
            onTapMoreIcon: showChart,
          ),
          _buildContentSalary(),
          SizedBox(height: 18),
          HistorySalaryWidget(
            isExpanded: isExpandedList[1],
            overlayEntry: _overlayEntry,
            iconKey: _iconKey,
            onTap: () {
              expandDetailSalary(1);
            },
          ),
          SizedBox(height: 18),
        ],
      ),
    );
  }

  Widget _buildContentSalary() {
    return Visibility(
      visible: isExpandedList[0],
      maintainSize: false,
      maintainAnimation: false,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: isShowChart
            ? _buildChartSalary()
            : DetailSalaryWidget(salaryByMonth: salaryByMonth),
      ),
    );
  }

  Widget _buildChartSalary() {
    final availableHeight = MediaQuery.of(context).size.height
        - kToolbarHeight
        - kBottomNavigationBarHeight
        - kTextTabBarHeight
        - MediaQuery.of(context).padding.top
        - MediaQuery.of(context).padding.bottom - 170;

    return Container(
      color: Colors.white,
      height: availableHeight,
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
            maximum: dataSalary.map((e) => e.salary).reduce((a, b) => a > b ? a : b) + 1,
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
            yValueMapper: (SalaryData sales, _) => sales.salary,
            name: 'Lương',
            dataLabelSettings: const DataLabelSettings(isVisible: false),
            markerSettings: const MarkerSettings(isVisible: true, color: Colors.lightGreen, width: 9),
          ),
          ColumnSeries<SalaryData, String>(
            dataSource: dataSalary,
            xValueMapper: (SalaryData s, _) => s.month,
            yValueMapper: (SalaryData s, _) => s.salary,
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
                'Lương tháng : ${salary.salary.toStringAsFixed(1)}M',
                style: const TextStyle(color: Colors.black),
              ),
            ],
          )
        ],
      ),
    );
  }
}