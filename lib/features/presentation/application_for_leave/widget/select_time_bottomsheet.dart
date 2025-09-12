import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void showSelectTimeBottomSheet(BuildContext context) {
  final now = DateTime.now();

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
              _buildTimeHeader(now),
              const Divider(),
              _buildSelectTimes(now),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildTimeHeader(DateTime now) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        DateFormat('dd/MM/yyyy').format(now),
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}

Widget _buildSelectTimes(DateTime now) {
  // Tạo danh sách các mốc giờ cách nhau 30 phút
  final List<DateTime> timeSlots = List.generate(
    48,
        (index) => DateTime(now.year, now.month, now.day, 0, index * 30),
  );

  final DateFormat timeFormat = DateFormat('HH:mm');

  return SizedBox(
    height: 300, // cố định chiều cao để có thể cuộn
    child: GridView.builder(
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: timeSlots.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 2.2,
      ),
      itemBuilder: (context, index) {
        final DateTime time = timeSlots[index];
        final bool isNow = time.hour == now.hour && time.minute == (now.minute ~/ 30) * 30;

        return GestureDetector(
          onTap: () {
            Navigator.pop(context, time);
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isNow ? Colors.red : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Text(
              timeFormat.format(time),
              style: TextStyle(
                color: isNow ? Colors.white : Colors.black87,
                fontWeight: isNow ? FontWeight.bold : FontWeight.normal,
                fontSize: 16,
              ),
            ),
          ),
        );
      },
    ),
  );
}
