import 'package:demo_1office/features/presentation/update_file/widget/Info_tab.dart';
import 'package:flutter/material.dart';

import '../../home/widget/home_header.dart';

class UpdateFilePage extends StatelessWidget {
  const UpdateFilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: Column(
            children: [
              const HomeHeader(userName: 'Cập nhật hồ sơ', isUpdateFile: true),
              _buildTabBar(),
              Expanded(child: TabBarView(children: [
                InfoTab(),
              ])),
            ],
          ),
        ),
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
            borderSide: BorderSide(color: Colors.green, width: 3),
          ),
          unselectedLabelColor: Colors.grey,
          dividerHeight: 0,
          tabs: const [
            Tab(child: Text("Thông tin", style: TextStyle(fontSize: 16))),
            Tab(child: Text("Lịch sử", style: TextStyle(fontSize: 16))),
          ],
        ),
      ),
    );
  }
}
