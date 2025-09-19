
import 'package:demo_1office/core/utils/chart_widget.dart';
import 'package:flutter/material.dart';
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
  final List<SalaryData> dataSalary = LoadData().dataSalary;
  List<bool> isExpandedList = [true, true];
  bool isShowChart = false;
  OverlayEntry? _overlayEntry;
  final GlobalKey _iconKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    dataSalary.removeLast();
  }

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
            ? ChartWidget(dataSalary: dataSalary)
            : DetailSalaryWidget(dataSalary: dataSalary),
      ),
    );
  }
}