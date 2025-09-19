import 'package:demo_1office/core/utils/chart_widget.dart';
import 'package:demo_1office/core/utils/data.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/detail_salary_widget.dart';
import '../../../../core/utils/header.dart';
import '../../../data/models/salary_data.dart';

class PayrollTab extends StatefulWidget {
  const PayrollTab({super.key});

  @override
  State<PayrollTab> createState() => _PayrollTab();
}

class _PayrollTab extends State<PayrollTab> {
  final List<SalaryData> dataSalary = LoadData().dataSalary;
  bool isExpand = true;
  bool isShowChart = false;

  @override
  void initState() {
    super.initState();
    dataSalary.removeLast();
  }

  void expandDetailSalary() {
    setState(() {
      isExpand = !isExpand;
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
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderTitle(
              title: "Lương thực nhận năm 2025",
              isExpand: isExpand,
              isMoreIcon: true,
              icon: isShowChart? Icons.list_alt_outlined : Icons.bar_chart,
              onTap: expandDetailSalary,
              onTapMoreIcon: showChart,
            ),
            _buildContentSalary(),
          ],
        ),
      ),
    );
  }

  Widget _buildContentSalary() {
    return Visibility(
      visible: isExpand,
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
