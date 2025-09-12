
import 'package:flutter/material.dart';

import '../../../../core/utils/detail_salary_widget.dart';
import '../../../../core/utils/header.dart';
import '../../../../core/utils/history_widget.dart';

class SalaryTab extends StatefulWidget {
  const SalaryTab({super.key});

  @override
  State<SalaryTab> createState() => _SalaryTab();
}

class _SalaryTab extends State<SalaryTab> {
  final List<int> salaryByMonth = List.generate(DateTime.now().month, (index) => 0,
  );
  List<bool> isExpandedList = [true, true];
  OverlayEntry? _overlayEntry;
  final GlobalKey _iconKey = GlobalKey();

  void expandDetailSalary(int index) {
    setState(() {
      isExpandedList[index] = !isExpandedList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitle(title: "Lương thực nhận năm 2025", isExpand: isExpandedList[0], onTap: () {
            expandDetailSalary(0);
          }, isMoreIcon: true, icon: Icons.bar_chart),
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
        child: DetailSalaryWidget(salaryByMonth: salaryByMonth)
    );
  }
}