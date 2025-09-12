import 'package:flutter/material.dart';

void showSelectCalendarBottomSheet(BuildContext context) {
  final now = DateTime.now();
  final int daysInMonth = DateTime(now.year, now.month + 1, 0).day;

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
            children: [
              _buildCalendarHeader(now),
              const Divider(),
              _buildSelectDays(now, daysInMonth),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildCalendarHeader(DateTime now) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Icon(Icons.chevron_left, size: 35),
      const Spacer(),
      Text(
        '${now.month}/${now.year}',
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      const Spacer(),
      const Icon(Icons.chevron_right, size: 35),
    ],
  );
}

Widget _buildSelectDays(DateTime now, int daysInMonth) {
  final int today = now.day;

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: daysInMonth,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final int day = index + 1;
        final bool isToday = day == today;

        return GestureDetector(
          onTap: () {
            Navigator.pop(context, DateTime(now.year, now.month, day));
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isToday ? Colors.red : Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              '$day',
              style: TextStyle(
                color: isToday ? Colors.white : Colors.black87,
                fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                fontSize: 18,
              ),
            ),
          ),
        );
      },
    ),
  );
}
