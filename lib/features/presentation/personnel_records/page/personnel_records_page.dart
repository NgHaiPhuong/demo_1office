
import 'package:demo_1office/features/presentation/personnel_records/widget/insurance_tab.dart';
import 'package:demo_1office/features/presentation/personnel_records/widget/job_tab.dart';
import 'package:demo_1office/features/presentation/personnel_records/widget/personnel_tab.dart';
import 'package:demo_1office/features/presentation/personnel_records/widget/vitae_tab.dart';
import 'package:flutter/material.dart';

import '../../home/widget/home_header.dart';

class PersonnelRecordsPage extends StatelessWidget {
  const PersonnelRecordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 7,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: Column(
            children: [
              const HomeHeader(userName: 'Nguyễn Thị Hải Phương'),
              _buildTabBar(),
              Expanded(
                child: TabBarView(children: [
                  PersonnelTab(),
                  VitaeTab(),
                  JobTab(),
                  InsuranceTab(),
                ]),
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
            Tab(child: Text("Thông tin chung", style: TextStyle(fontSize: 16))),
            Tab(child: Text("Sơ yếu lý lịch", style: TextStyle(fontSize: 16))),
            Tab(child: Text("Công việc & Hợp đồng", style: TextStyle(fontSize: 16))),
            Tab(child: Text("Bảo hiểm & Phúc lợi", style: TextStyle(fontSize: 16))),
            Tab(child: Text("Lương & Phụ cấp", style: TextStyle(fontSize: 16))),
            Tab(child: Text("Thông tin phép", style: TextStyle(fontSize: 16))),
            Tab(child: Text("Thông tin nghỉ bù", style: TextStyle(fontSize: 16))),
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
          _buildItemNavigationBar(Icons.cloud_upload_rounded, "Tải lên"),
          _buildItemNavigationBar(Icons.attach_file, "Đính kèm"),
          _buildItemNavigationBar(Icons.note_alt_rounded, "Cập nhật"),
          _buildItemNavigationBar(Icons.menu, "Danh mục"),
          _buildItemNavigationBar(Icons.person_outline_sharp, "Cá nhân"),
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
