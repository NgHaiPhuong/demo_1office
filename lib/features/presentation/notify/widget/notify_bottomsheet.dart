import 'package:flutter/material.dart';

import '../../../../core/utils/functional_item.dart';

void showNotifyBottomSheet(BuildContext context) {

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          border: Border(top: BorderSide(color: Color(0xFFE0E0E0), width: 1)),
        ),
        padding: const EdgeInsets.fromLTRB(20, 28, 20, 28),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Đánh dấu chưa đọc", style: const TextStyle(color: Colors.grey,fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              Divider(color: Colors.grey.shade300, height: 1),
              SizedBox(height: 16),
              Text("Gỡ thông báo này", style: const TextStyle(color: Colors.grey,fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      );
    },
  );
}
