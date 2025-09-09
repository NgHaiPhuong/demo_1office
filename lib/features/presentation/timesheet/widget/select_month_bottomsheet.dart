import 'package:flutter/material.dart';

void showSelectMonthBottomSheet(BuildContext context) {
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
              Divider(),
              _buildSelectMonth(),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildHeader(){
  final int currentYear = DateTime.now().year;
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Icon(Icons.chevron_left, size: 35),
      Spacer(),
      Text(
        '$currentYear',
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      Spacer(),
      const Icon(Icons.chevron_right, size: 35),
    ],
  );
}

Widget _buildSelectMonth(){
  final int currentMonth = DateTime.now().month;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 12,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 30,
        crossAxisSpacing: 90,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final int month = index + 1;
        final bool isCurrent = month == currentMonth;

        return GestureDetector(
          onTap: () {
            Navigator.pop(context, month);
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isCurrent ? Colors.red : Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              '$month',
              style: TextStyle(
                color: isCurrent ? Colors.white : Colors.black87,
                fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                fontSize: 22,
              ),
            ),

          ),
        );
      },
    ),
  );
}
