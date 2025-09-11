
import 'package:demo_1office/core/utils/no_data.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/header.dart';

class InsuranceTab extends StatefulWidget {
  const InsuranceTab({super.key});

  @override
  State<InsuranceTab> createState() => _InsuranceTab();
}

class _InsuranceTab extends State<InsuranceTab> {

  List<bool> isExpandedList = [true, true];

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
          _buildInsuranceInfo(),
          SizedBox(height: 18),
          _buildHistory(),
          SizedBox(height: 18),
        ],
      ),
    );
  }

  Widget _buildHistory() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitle(title: "Lịch sử giải quyết chế độ", isExpand: isExpandedList[1], onTap: () {
            expandDetailSalary(1);
          }),
          Visibility(
              visible: isExpandedList[1],
              maintainSize: false,
              maintainAnimation: false,
              child: NoData()
          )
        ],
      ),
    );
  }

  Widget _buildInsuranceInfo() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitle(title: "Công nợ", isExpand: isExpandedList[0], onTap: () {
            expandDetailSalary(0);
          }),
          _buildInsuranceContent("Nghiệp vụ báo tăng"),
          _buildInsuranceContent("Nghiệp vụ báo giarm"),
        ],
      ),
    );
  }

  Widget _buildInsuranceContent(String title) {
    return Visibility(
      visible: isExpandedList[0],
      maintainSize: false,
      maintainAnimation: false,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey, width: 1)
          )
        ),
        child: Text(
          title,
          style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}