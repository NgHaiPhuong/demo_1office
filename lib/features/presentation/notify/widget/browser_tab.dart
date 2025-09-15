
import 'package:demo_1office/features/data/models/notification_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/data.dart';

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
      child: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final item = notifications[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (index == 0 || notifications[index - 1].date != item.date)
                _buildHeaderDate(item),

              _buildNotifyItem(item),
              SizedBox(height: 12),
              const Divider(height: 1),
              SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }

  Widget _buildNotifyItem(NotificationItem item) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(item.iconUrl),
      ),
      title: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 16, color: Colors.black),
          children: [
            TextSpan(
                text: "${item.sender} ",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextSpan(text: item.content),
          ],
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Text("${item.time} ${item.date} • ${item.category}", style: TextStyle(fontSize: 16),),
      ),
      trailing: const Icon(Icons.more_horiz),
    );
  }

  Widget _buildHeaderDate(NotificationItem item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Center(
        child: Text(
          "Thứ ${_getWeekday(item.date)}, ${item.date}",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
    );
  }

  String _getWeekday(String date) {
    final parts = date.split("/");
    final day = int.parse(parts[0]);
    final month = int.parse(parts[1]);
    final year = int.parse(parts[2]);
    final weekday = DateTime(year, month, day).weekday;
    const weekdays = [
      "2", "3", "4", "5", "6", "7", "CN"
    ];
    return weekdays[weekday - 1];
  }
}