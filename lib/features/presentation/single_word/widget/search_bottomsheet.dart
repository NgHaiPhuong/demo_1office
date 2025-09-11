import 'package:flutter/material.dart';
import '../../../../core/utils/functional_item.dart';

void showSearchBottomSheet(BuildContext context) {
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
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Tìm kiếm',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextField(
                  decoration: InputDecoration(
                    label: Text('Từ khóa'),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Nhập từ khóa',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Spacer(),
                  Text('Tìm kiêm nâng cao', style: TextStyle(fontSize: 16, color: Colors.lightGreen)),
                ],
              ),
              const SizedBox(height: 8),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: _buildButton('LƯU TÌM KIẾM', () {
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
              ),
            ],
          ),
        ),
      );
    },
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
      side: isSelected
          ? const BorderSide(color: Colors.grey)
          : BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
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


