import 'package:demo_1office/features/presentation/timesheet/widget/weekly_timesheet.dart';
import '../../home/widget/home_header.dart';
import 'package:flutter/material.dart';
import '../../individual/page/individual_bottomsheet.dart';
import '../widget/category_bottomsheet.dart';
import '../widget/select_month_bottomsheet.dart';
import '../widget/list.dart';
import '../widget/monthly_timesheet.dart';
import '../widget/statistical.dart';

class TimesheetPage extends StatelessWidget {
  const TimesheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: Column(
            children: [
              const HomeHeader(userName: 'Bảng công toàn bộ'),
              _buildTabSection(),
            ],
          ),
        ),
        bottomNavigationBar: _buildNavigationBar(context),
      ),
    );
  }

  Widget _buildTabSection() {
    return Expanded(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 2),
            color: Colors.white,
            child: const TabBar(
              indicatorColor: Colors.red,
              labelColor: Colors.red,
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              tabs: [
                Tab(text: 'Công tháng'),
                Tab(text: 'Công tuần'),
                Tab(text: 'Thống kê'),
                Tab(text: 'Danh sách'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                MonthlyTimesheet(),
                WeeklyTimesheet(),
                Statistical(),
                List(),
              ],
            ),
          ),
        ],
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
          _buildItemNavigationBar(Icons.menu, 'Danh mục', () {
            showCategoryBottomSheet(context);
          }),
          _buildItemNavigationBar(Icons.date_range_rounded, 'Chọn tháng',(){
            showSelectMonthBottomSheet(context);
          }),
          _buildItemNavigationBar(Icons.person_outline, 'Cá nhân', () {
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
