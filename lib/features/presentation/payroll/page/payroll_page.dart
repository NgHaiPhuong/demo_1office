import 'package:demo_1office/features/presentation/payroll/tab/all_tab.dart';
import 'package:demo_1office/features/presentation/payroll/tab/history_tab.dart';
import 'package:demo_1office/features/presentation/payroll/tab/payroll_tab.dart';
import 'package:flutter/material.dart';

import '../../home/widget/home_header.dart';
import '../../individual/page/individual_bottomsheet.dart';
import '../widget/category_bottom_sheet.dart';
import '../widget/select_year_bottomsheet.dart';

class PayrollPage extends StatefulWidget {
  const PayrollPage({super.key});

  @override
  State<PayrollPage> createState() => _PayrollPage();
}

class _PayrollPage extends State<PayrollPage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: Column(
            children: [
              const HomeHeader(userName: 'Nguyễn Thị Hải Phương'),
              _buildTabBar(),
              Expanded(
                child: TabBarView(children: [PayrollTab(), AllTab(), HistoryTab()]),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildNavigationBar(context),
      ),
    );
  }

  Widget _buildTabBar() {
    return Material(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: BoxBorder.all(width: 0.2, color: Colors.grey.shade300),
        ),
        child: TabBar(
          isScrollable: true,
          labelColor: Colors.green,
          indicatorColor: Colors.green,
          tabAlignment: TabAlignment.start,
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(
              color: Colors.green,
              width: 3,
            ),
          ),
          unselectedLabelColor: Colors.grey,
          dividerHeight: 0,
          tabs: const [
            Tab(child: Text("Bảng lương", style: TextStyle(fontSize: 16))),
            Tab(child: Text("Tất cả", style: TextStyle(fontSize: 16))),
            Tab(child: Text("Lịch sử lương và phụ cấp", style: TextStyle(fontSize: 16))),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6),
      height: 80,
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildItemNavigationBar(Icons.menu, "Danh mục", () {
            showCategoryPayrollBottomSheet(context);
          }),
          _buildItemNavigationBar(Icons.date_range_rounded, "Chọn năm", () {
            showSelectYearBottomSheet(context);
          }),
          _buildItemNavigationBar(Icons.person_outline, "Cá nhân", () {
            showIndividualBottomSheet(context);
          }),
        ],
      ),
    );
  }

  Widget _buildItemNavigationBar(IconData icon, String label,
      [VoidCallback? onTap]) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: 30),
          Text(label, style: TextStyle(fontSize: 12))
        ],
      ),
    );
  }
}