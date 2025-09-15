import 'package:demo_1office/core/utils/no_data.dart';
import 'package:demo_1office/features/data/models/notification_item.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/data.dart';

class TicketTab extends StatefulWidget {
  const TicketTab({super.key});

  @override
  State<TicketTab> createState() => _TicketTab();
}

class _TicketTab extends State<TicketTab> {

  final List<NotificationItem> notifications = LoadData().notifications;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NoData(message: "Không có thông báo mới"),
        ],
      ),
    );
  }
}