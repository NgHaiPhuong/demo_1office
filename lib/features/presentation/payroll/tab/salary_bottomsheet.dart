import 'package:demo_1office/core/utils/utils.dart';
import 'package:demo_1office/features/data/models/salary_data.dart';
import 'package:demo_1office/features/presentation/payroll/tab/salary_tab.dart';
import 'package:flutter/material.dart';

import 'exchange_tab.dart';

void showSalaryBottomSheet(BuildContext context, SalaryData salaryData) {

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    enableDrag: false,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            border: Border(top: BorderSide(color: Color(0xFFE0E0E0), width: 1)),
          ),
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                _buildHeader(salaryData.month),
                Divider(color: Colors.grey.shade200),
                SizedBox(height: 12),
                _buildSalaryTotal(Utils().formatMoney(salaryData.salary)),
                SizedBox(height: 16),
                Center(
                  child: Text(
                    "BẢNG LƯƠNG TERACOM",
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ),
                SizedBox(height: 16),
                _buildTabBar(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: TabBarView(
                    children: [WorkingSalaryTab(), ExchangeTab()],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget _buildTabBar() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(50),
    child: Container(
      color: Colors.grey.shade200,
      child: const TabBar(
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 3.0, color: Colors.green),
        ),
        labelColor: Colors.black,
        unselectedLabelColor: Colors.black54,
        tabs: [
          Tab(text: "Lương làm việc"),
          Tab(text: "Trao đổi với HR"),
        ],
      ),
    ),
  );
}

Widget _buildSalaryTotal(String salary) {
  return Container(
    padding: const EdgeInsets.all(20),
    margin: const EdgeInsets.symmetric(vertical: 5),
    decoration: BoxDecoration(
      color: const Color(0xFFFFF8E1),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Tổng lương thực nhận",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 5),
            Text(
              salary,
              style: const TextStyle(
                fontSize: 32,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Image.asset(
          "assets/images/salary.png",
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ],
    ),
  );
}

Widget _buildHeader(String month) {
  return Padding(
    padding: const EdgeInsets.all(12),
    child: Text(
      "Phiếu lương $month/2025",
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );
}
