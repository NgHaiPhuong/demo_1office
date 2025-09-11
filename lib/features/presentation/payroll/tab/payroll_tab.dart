import 'package:flutter/material.dart';

import '../../../../core/utils/detail_salary_widget.dart';
import '../../../../core/utils/header.dart';

class PayrollTab extends StatefulWidget {
  const PayrollTab({super.key});

  @override
  State<PayrollTab> createState() => _PayrollTab();
}

class _PayrollTab extends State<PayrollTab> {
  final List<int> salaryByMonth = List.generate(
    DateTime.now().month,
    (index) => 0,
  );
  bool isExpand = true;

  void expandDetailSalary () {
    setState(() {
      isExpand = !isExpand;
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
            HeaderTitle(title: "Lương thực nhận năm 2025", isExpand: isExpand, onTap: () {
              expandDetailSalary;
            }, isMoreIcon: true, icon: Icons.bar_chart),
            _buildContentSalary()
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
      child: DetailSalaryWidget(salaryByMonth: salaryByMonth)
    );
  }
}
