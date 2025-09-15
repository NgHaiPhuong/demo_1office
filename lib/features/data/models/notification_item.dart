
class NotificationItem {
  final String sender;
  final String content;
  final String time;
  final String date;
  final String category;
  final String iconUrl;
  final bool isUnread;

  NotificationItem({
    required this.sender,
    required this.content,
    required this.time,
    required this.date,
    required this.category,
    required this.iconUrl,
    this.isUnread = true,
  });
}