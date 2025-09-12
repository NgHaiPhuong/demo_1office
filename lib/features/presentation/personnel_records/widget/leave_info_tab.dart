
import 'package:demo_1office/core/utils/no_data.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/header.dart';

class LeaveInfoTab extends StatefulWidget {
  const LeaveInfoTab({super.key});

  @override
  State<LeaveInfoTab> createState() => _LeaveInfoTab();
}

class _LeaveInfoTab extends State<LeaveInfoTab> {
  List<bool> isExpandedList = [true, true, true];

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
          _leaveInfo("Thông tin phép năm", 0),
          SizedBox(height: 18),
          _leaveInfo("Thông tin phép tháng", 1),
          SizedBox(height: 18),
          _leaveInfo("Lịch sử sử dụng", 2),
          SizedBox(height: 18),
        ],
      ),
    );
  }

  Widget _leaveInfo(String text, int index) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitle(title: text, isExpand: isExpandedList[index], onTap: () {
            expandDetailSalary(index);
          }),
          _buildData(index)
        ],
      ),
    );
  }

  Widget _buildData(int index) {
    return Visibility(
        visible: isExpandedList[index],
        maintainSize: false,
        maintainAnimation: false,
        child: NoData()
    );
  }
}