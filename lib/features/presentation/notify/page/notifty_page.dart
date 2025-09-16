
import 'package:demo_1office/features/presentation/notify/widget/all_notify_tab.dart';
import 'package:flutter/material.dart';

import '../widget/browser_tab.dart';
import '../widget/job_notify_tab.dart';
import '../widget/notify_header.dart';
import '../widget/ticket_tab.dart';

class NotifyPage extends StatefulWidget {
  const NotifyPage({super.key});

  @override
  State<NotifyPage> createState() => _NotifyPage();
}

class _NotifyPage extends State<NotifyPage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: Column(
            children: [
              const NotifyHeader(title: "Hộp thông báo", showBackButton: true),
              _buildTabBar(),
              Expanded(
                child: TabBarView(children: [
                  AllNotifyTab(), JobNotifyTab(), BrowserTab(), TicketTab()
                ]),
              ),
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
            Tab(child: Text("Tất cả", style: TextStyle(fontSize: 16))),
            Tab(child: Text("Công việc", style: TextStyle(fontSize: 16))),
            Tab(child: Text("Duyệt", style: TextStyle(fontSize: 16))),
            Tab(child: Text("Ticket", style: TextStyle(fontSize: 16))),
          ],
        ),
      ),
    );
  }
}