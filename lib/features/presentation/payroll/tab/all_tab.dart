import 'package:demo_1office/core/utils/no_data.dart';
import 'package:demo_1office/features/presentation/timesheet/widget/select_month_bottomsheet.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/header.dart';

class AllTab extends StatefulWidget {
  const AllTab({super.key});

  @override
  State<AllTab> createState() => _AllTab();
}

class _AllTab extends State<AllTab> {
  bool isExpand = true;

  void expandDetailSalary() {
    setState(() {
      isExpand = !isExpand;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.withValues(alpha: 0.055),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderTitle(
              title: "Danh sách bảng lương 2025",
              isExpand: isExpand,
              onTap: expandDetailSalary,
              isMoreIcon: true,
              icon: Icons.calendar_month_outlined,
              onTapMoreIcon: () {
                showSelectMonthBottomSheet(context);
              },
            ),
            Visibility(
              visible: isExpand,
              maintainSize: false,
              maintainAnimation: false,
              child: NoData(),
            ),
          ],
        ),
      ),
    );
  }
}
