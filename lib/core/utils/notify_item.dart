
import 'package:flutter/material.dart';

import '../../features/data/models/notification_item.dart';
import '../../features/presentation/notify/widget/notify_bottomsheet.dart';

class NotifyItem extends StatelessWidget {
  final String? message;
  final List<NotificationItem> notifications;

  const NotifyItem({super.key, this.message, required this.notifications});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final item = notifications[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (index == 0 || notifications[index - 1].date != item.date)
              _buildHeaderDate(item),

            _buildNotifyItem(context, item),
            SizedBox(height: 12),
            Divider(height: 1, color: Colors.grey.shade300),
            SizedBox(height: 18),
          ],
        );
      },
    );
  }

  Widget _buildNotifyItem(BuildContext context, NotificationItem item) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(item.iconUrl),
      ),
      title: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 18, color: Colors.black),
          children: [
            TextSpan(
                text: "${item.sender} ",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextSpan(text: item.content),
          ],
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Text("${item.time} ${item.date} • ${item.category}", style: TextStyle(fontSize: 18),),
      ),
      trailing: InkWell(onTap: () {
        showNotifyBottomSheet(context);
      }, child: Icon(Icons.more_horiz)),
    );
  }

  Widget _buildHeaderDate(NotificationItem item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Center(
        child: Text(
          "Thứ ${_getWeekday(item.date)}, ${item.date}",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
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
