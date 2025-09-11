import 'package:flutter/material.dart';
import '../../../../core/utils/functional_item.dart';

void showFastFilterBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          border: Border(
            top: BorderSide(color: Color(0xFFE0E0E0), width: 1),
          ),
        ),
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tất cả', style: TextStyle(fontSize: 18,color: Colors.lightGreen)),
              SizedBox(height: 12),
              Text('Đơn xin nghỉ', style: TextStyle(fontSize: 18)),
              SizedBox(height: 12),
              Text('Đơn vắng mặt', style: TextStyle(fontSize: 18)),
              SizedBox(height: 12),
              Text('Đơn làm thêm', style: TextStyle(fontSize: 18)),
              SizedBox(height: 12),
              Text('Đơn checkin/out', style: TextStyle(fontSize: 18)),
              SizedBox(height: 12),
              Text('Đơn tăng ca', style: TextStyle(fontSize: 18)),
              SizedBox(height: 12),
              Text('Đơn công tác', style: TextStyle(fontSize: 18)),
              SizedBox(height: 12),
              Text('Đơn laàm theo chế độ', style: TextStyle(fontSize: 18)),
              SizedBox(height: 12),
              Text('Đơn thôi việc', style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      );
    },
  );
}

