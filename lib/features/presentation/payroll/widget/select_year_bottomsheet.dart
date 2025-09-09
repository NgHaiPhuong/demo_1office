import 'dart:ffi';

import 'package:flutter/material.dart';

void showSelectYearBottomSheet(BuildContext context) {

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              SizedBox(height: 12),
              Divider(),
              SizedBox(height: 12),
              _buildSelectMonth(),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildHeader(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Icon(Icons.chevron_left, size: 24),
      Spacer(),
      Text(
        "2025-2033",
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      Spacer(),
      const Icon(Icons.chevron_right, size: 24),
    ],
  );
}

Widget _buildSelectMonth(){
  final int currentYear = DateTime.now().year;
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    margin: const EdgeInsets.symmetric(horizontal: 15),
    child: GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 9,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 30,
        crossAxisSpacing: 70,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final year = currentYear + index;
        final bool isCurrent = year == currentYear;

        return GestureDetector(
          onTap: () {
            Navigator.pop(context, year);
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isCurrent ? Colors.green : Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              '$year',
              style: TextStyle(
                color: isCurrent ? Colors.white : Colors.black87,
                fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                fontSize: 16,
              ),
            ),
          ),
        );
      },
    ),
  );
}
