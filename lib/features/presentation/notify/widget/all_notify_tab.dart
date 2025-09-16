
import 'package:demo_1office/core/utils/notify_item.dart';
import 'package:demo_1office/features/data/models/notification_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/data.dart';

class AllNotifyTab extends StatefulWidget {
  const AllNotifyTab({super.key});

  @override
  State<AllNotifyTab> createState() => _AllNotifyTab();
}

class _AllNotifyTab extends State<AllNotifyTab> {

  final List<NotificationItem> notifications = LoadData().notifications;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      color: Colors.white,
      child: NotifyItem(notifications: notifications),
    );
  }
}