import 'package:flutter/material.dart';

class MenuItem {
  final String id;
  final String title;
  final IconData icon;
  final Color color;
  final String group;
  final bool isActive;

  MenuItem({
    required this.id,
    required this.title,
    required this.icon,
    required this.color,
    required this.group,
    this.isActive = false,
  });
}