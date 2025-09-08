import 'package:flutter/material.dart';
import '../../features/data/models/menu_item.dart';

class LoadData {
  final List<MenuItem> menuItems = [
    MenuItem(id: "network", title: "Mạng nội bộ", icon: Icons.language, color: Colors.blue, group: "WORKPLACE", isActive: true),
    MenuItem(id: "sign", title: "Ký số", icon: Icons.edit, color: Colors. blue, group: "WORKPLACE", isActive: true),
    MenuItem(id: "task", title: "Công việc", icon: Icons.task, color: Colors.green , group: "WORKPLACE"),
    MenuItem(id: "project", title: "Dự án", icon: Icons.work, color: Colors.yellow , group: "WORKPLACE"),
    MenuItem(id: "process", title: "Quy trình", icon: Icons.account_tree, color: Colors.purple , group: "WORKPLACE"),
    MenuItem(id: "document", title: "Tài liệu", icon: Icons.book, color: Colors.orange , group: "WORKPLACE"),
    MenuItem(id: "calendar", title: "Lịch biểu", icon: Icons.calendar_today, color: Colors.redAccent , group: "WORKPLACE"),
    MenuItem(id: "paper", title: "Văn bản", icon: Icons.description, color: Colors.orange, group: "WORKPLACE"),
    MenuItem(id: "asset", title: "Tài sản", icon: Icons.devices_other, color: Colors.green , group: "WORKPLACE"),

    MenuItem(id: "form", title: "Đơn từ", icon: Icons.note, color: Colors.blue, group: "HRM", isActive: true),
    MenuItem(id: "recruit", title: "Tuyển dụng", icon: Icons.person_add, color: Colors.orange, group: "HRM"),
    MenuItem(id: "hr", title: "Nhân sự", icon: Icons.group, color: Colors.green, group: "HRM"),
    MenuItem(id: "evaluate", title: "Đánh giá", icon: Icons.fact_check, color: Colors.yellow, group: "HRM"),
    MenuItem(id: "ivan", title: "IVAN", icon: Icons.umbrella, color: Colors.purple, group: "HRM"),
    MenuItem(id: "training", title: "Đào tạo", icon: Icons.school, color: Colors.redAccent, group: "HRM"),
    MenuItem(id: "attendance", title: "Chấm công", icon: Icons.check_circle, color: Colors.blue, group: "HRM"),
    MenuItem(id: "payroll", title: "Bảng lương", icon: Icons.attach_money, color: Colors.redAccent, group: "HRM"),
    MenuItem(id: "kpi", title: "KPI", icon: Icons.track_changes, color: Colors.green, group: "HRM"),
    MenuItem(id: "okr", title: "OKR", icon: Icons.show_chart, color: Colors.yellow, group: "HRM"),

    MenuItem(id: "finance", title: "Tài chính", icon: Icons.account_balance_wallet, color: Colors.blue ,group: "CRM"),
    MenuItem(id: "marketing", title: "Marketing", icon: Icons.campaign, color: Colors.orange ,group: "CRM"),
    MenuItem(id: "sales", title: "Bán hàng", icon: Icons.shopping_cart, color: Colors.yellow ,group: "CRM"),
    MenuItem(id: "customer", title: "Khách hàng", icon: Icons.chat, color: Colors.purple ,group: "CRM"),
    MenuItem(id: "warehouse", title: "Kho hàng", icon: Icons.inventory, color: Colors.redAccent ,group: "CRM"),
    MenuItem(id: "purchase", title: "Mua hàng", icon: Icons.shopping_bag, color: Colors.purple ,group: "CRM"),
    MenuItem(id: "promotion", title: "Khuyến mại", icon: Icons.local_offer, color: Colors.blue ,group: "CRM"),

    MenuItem(id: "one", title: "One", icon: Icons.change_history, color: Colors.orange, group: "ADVANCE"),
    MenuItem(id: "support", title: "Hỗ trợ", icon: Icons.headset, color: Colors.blue, group: "ADVANCE", isActive: true),
    MenuItem(id: "report", title: "Báo cáo", icon: Icons.bar_chart, color: Colors.orange, group: "ADVANCE"),
  ];
}