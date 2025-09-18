import 'package:flutter/material.dart';

import '../../personnel_records/widget/salary_tab.dart';

void showSalaryBottomSheet(BuildContext context, int month) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
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
                _buildHeader(month),
                Divider(color: Colors.grey.shade200),
                SizedBox(height: 12),
                _buildSalaryTotal(),
                SizedBox(height: 16),
                Center(
                  child: Text(
                    "BẢNG LƯƠNG TERACOM",
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ),
                SizedBox(height: 16),
                _buildTabBar(),
                Expanded(
                  child: TabBarView(children: [SalaryTab(), SalaryTab()    ]),
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

Widget _buildSalaryTotal() {
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
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tổng lương thực nhận",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            SizedBox(height: 5),
            Text(
              "0",
              style: TextStyle(
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

Widget _buildHeader(int month) {
  return Padding(
    padding: const EdgeInsets.all(12),
    child: Text(
      "Phiếu lương tháng $month/2025",
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );
}
