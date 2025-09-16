
import 'package:demo_1office/features/data/models/notification_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/data.dart';
import '../../../../core/utils/notify_item.dart';

class BrowserTab extends StatefulWidget {
  const BrowserTab({super.key});

  @override
  State<BrowserTab> createState() => _BrowserTab();
}

class _BrowserTab extends State<BrowserTab> {

  final List<NotificationItem> notifications = LoadData().notifications;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.only(top: 16),
        color: Colors.white,
        child: NotifyItem(notifications: notifications),
      )
    );
  }
}