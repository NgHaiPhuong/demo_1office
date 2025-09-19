import 'package:flutter/material.dart';

void showFilterBottomSheet(BuildContext context) {
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
          border: Border(
            top: BorderSide(color: Color(0xFFE0E0E0), width: 1),
          ),
        ),
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFilterItem(text: 'Tất cả', isSelected: true),
              _buildFilterItem(text: 'Hồ sơ ký số'),
              _buildFilterItem(text: 'Đơn xin nghỉ'),
              _buildFilterItem(text: 'Đơn vắng mặt'),
              _buildFilterItem(text: 'Đơn checkin/out'),
              _buildFilterItem(text: 'Đơn đổi ca'),
              _buildFilterItem(text: 'Đơn tăng ca'),
              _buildFilterItem(text: 'Đơn đăng ký ca'),
              _buildFilterItem(text: 'Đơn làm thêm'),
              _buildFilterItem(text: 'Đơn công tác'),
              _buildFilterItem(text: 'Đơn làm theo chế độ'),
              _buildFilterItem(text: 'Đơn thôi việc'),
              _buildFilterItem(text: 'Cập nhật thông tin'),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildFilterItem({
  required String text,
  VoidCallback? onTap,
  bool isSelected = false,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.lightGreen : Colors.black,
          ),
        ),
      ),
    ),
  );
}
