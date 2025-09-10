import 'package:flutter/material.dart';

class WorkProcessItem {
  final String date;
  final String status;
  final Color statusColor;
  final String title;
  final String details;

  WorkProcessItem({
    required this.date,
    required this.status,
    required this.statusColor,
    required this.title,
    required this.details,
  });
}
