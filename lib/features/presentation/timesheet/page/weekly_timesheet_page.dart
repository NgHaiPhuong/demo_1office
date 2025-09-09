/*
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeeklyTimeSheetPage extends StatelessWidget {
  const WeeklyTimeSheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            _buildHeaderWeek(),
            _buildContentDay(),
          ],
        ),
      ),
    );
  }
Widget _buildHeaderWeek(){
  final today = DateTime.now();
  final startOfWeek = today.subtract(Duration(days: today.weekday - 1));
  final endOfWeek = startOfWeek.add(const Duration(days: 6));

  final dateFormat = DateFormat('dd/MM');
  final String weekRange =
      '${dateFormat.format(startOfWeek)} - ${dateFormat.format(endOfWeek)}';
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
    child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.chevron_left, size: 35),
          Spacer(),
          Text(
            'Tuần $weekRange',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ),
          Spacer(),
          const Icon(Icons.chevron_right, size: 35),
        ],
          ),
      ),
  );
}

Widget _buildContentDay(){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: [
                  Text('T.2',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  SizedBox(height: 8),
                  Text('08/09',style: TextStyle(fontSize: 20,color: Colors.grey,fontWeight: FontWeight.w500),),
                ],
              ),
            ),
          ),
          Container(
            width: 1,
            height: 60,
            color: Colors.grey,
            margin: const EdgeInsets.symmetric(horizontal: 16),
          ),
          Expanded(
              flex: 1,
              child: Text('1',style: TextStyle(fontSize: 24,color: Colors.red,fontWeight: FontWeight.w500),)),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('8:30 - 18:30',style: TextStyle(fontSize: 18,color: Colors.grey,fontWeight: FontWeight.w500),),
                SizedBox(height: 8),
                Text('HC',style: TextStyle(fontSize: 18,color: Colors.grey,fontWeight: FontWeight.w500),),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

}
*/

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeeklyTimeSheetPage extends StatelessWidget {
  const WeeklyTimeSheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            _buildHeaderWeek(),
            Expanded(
              child: ListView(children: _buildWeekContent()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderWeek() {
    final today = DateTime.now();
    final startOfWeek = today.subtract(Duration(days: today.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(days: 6));

    final dateFormat = DateFormat('dd/MM');
    final String weekRange =
        '${dateFormat.format(startOfWeek)} - ${dateFormat.format(endOfWeek)}';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.chevron_left, size: 35),
            const Spacer(),
            Text(
              'Tuần $weekRange',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            const Icon(Icons.chevron_right, size: 35),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildWeekContent() {
    final today = DateTime.now();
    final startOfWeek = today.subtract(Duration(days: today.weekday - 1));

    final List<String> weekdays = [
      'T.2',
      'T.3',
      'T.4',
      'T.5',
      'T.6',
      'T.7',
      'CN',
    ];

    return List.generate(7, (index) {
      final day = startOfWeek.add(Duration(days: index));
      final isToday = day.day == today.day &&
          day.month == today.month &&
          day.year == today.year;
      final isFuture = day.isAfter(today);
      final isWeekend = index >= 5;

      return _buildContentDay(
        title: weekdays[index],
        date: DateFormat('dd/MM').format(day),
        isToday: isToday,
        isFuture: isFuture,
        isWeekend: isWeekend,
      );
    });
  }

  Widget _buildContentDay({
    required String title,
    required String date,
    required bool isToday,
    required bool isFuture,
    required bool isWeekend,
  }) {
    final bgColor = isToday ? Colors.blue[50] : Colors.white;
    final number = isWeekend ? 'N' : (isFuture ? '0' : '1');

    final numberColor = (number == '1') ? Colors.red : Colors.black;

    final textColor = isFuture || isWeekend ? Colors.grey : Colors.black;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 1,
              height: 60,
              color: Colors.grey,
              margin: const EdgeInsets.symmetric(horizontal: 16),
            ),
            Expanded(
              flex: 1,
              child: Text(
                number,
                style: TextStyle(
                  fontSize: 24,
                  color: numberColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (!isWeekend)
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '8:30 - 18:30',
                      style: TextStyle(
                        fontSize: 18,
                        color: textColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'HC',
                      style: TextStyle(
                        fontSize: 18,
                        color: textColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
            else
              const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}


