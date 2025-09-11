import 'package:demo_1office/features/presentation/timesheet/widget/weekly_timesheet.dart';
import '../../home/widget/home_header.dart';
import 'package:flutter/material.dart';
import '../../individual/page/individual_bottomsheet.dart';
import '../../timesheet/widget/list.dart';
import '../../timesheet/widget/monthly_timesheet.dart';
import '../../timesheet/widget/statistical.dart';
import '../widget/general_settings.dart';
import '../widget/security.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cài đặt tài khoản'),
        ),
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: Column(
            children: [
              _buildTabSection(),
            ],
          ),
        ),
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
                Tab(text: 'Cài đặt chung'),
                Tab(text: 'Bảo vệ 2 lớp'),
                Tab(text: 'Quyền sử dụng'),
                Tab(text: 'Lịch sử truy cập'),
                Tab(text: 'Thiết bị'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                GeneralSettings(),
                Security(),
                List(),
                List(),
                List(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
