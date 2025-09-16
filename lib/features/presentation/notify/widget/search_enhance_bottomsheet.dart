import 'package:demo_1office/features/presentation/application/page/application_page.dart';
import 'package:demo_1office/features/presentation/employee/page/employee_page.dart';
import 'package:flutter/material.dart';

import '../../application_for_leave/widget/select_calendar_bottomsheet.dart';

void showSearchEnhanceBottomSheet(BuildContext context) {

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
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Tìm kiếm nâng cao',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Divider(),
              _buildTextField(label: "Ứng dụng", icon: Icons.keyboard_arrow_down, onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ApplicationPage(),
                  ),
                );
              }),
              _buildTextField(label: "Nhân sự", icon: Icons.search_rounded, onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EmployeePage(),
                  ),
                );
              }),
              const SizedBox(height: 10),
              _buildDate(context),
              SizedBox(height: 20),
              _buildBtnRow(context),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildDate(BuildContext context) {
  return Row(
    children: [
      _buildBtnDate(context, 'Từ ngày'),
      const SizedBox(width: 16),
      _buildBtnDate(context, 'Đến ngày'),
    ],
  );
}

Widget _buildBtnDate(BuildContext context, String title) {
  return Expanded(
    flex: 3,
    child: TextField(
      readOnly: true,
      decoration: InputDecoration(
        hintText: title,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        suffixIcon: const Icon(Icons.calendar_today),
      ),
      onTap: () {
        showSelectCalendarBottomSheet(context);
      },
    ),
  );
}

Widget _buildBtnRow(BuildContext context) {
  return  Row(
    children: [
      Expanded(
        child: _buildButton('ĐẶT LẠI', () {
          Navigator.of(context).pop();
        }, isSelected: true),
      ),
      const SizedBox(width: 16),
      Expanded(
        child: _buildButton('TÌM KIẾM', () {
          // Implement search functionality here
          Navigator.of(context).pop();
        }),
      ),
    ],
  );
}

Widget _buildTextField({required String label, String? value, IconData? icon, VoidCallback? onTap}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: TextField(
      readOnly: true,
      onTap: onTap,
      controller: TextEditingController(text: value),
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey, width: 2),
        ),
        suffixIcon: Icon(icon, size: 24, color: Colors.grey),
      ),
    ),
  );
}

Widget _buildButton(
  String text,
  VoidCallback onPressed, {
  bool isSelected = false,
  Color backgroundColor = Colors.lightGreen,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: isSelected ? Colors.white : backgroundColor,
      foregroundColor: isSelected ? Colors.black : Colors.white,
      side: isSelected ? const BorderSide(color: Colors.grey) : BorderSide.none,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
    ),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 16,
        color: isSelected ? Colors.black : Colors.white,
      ),
    ),
  );
}
