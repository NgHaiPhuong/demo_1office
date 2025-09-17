/*
import 'package:flutter/material.dart';

class MonthlyTimesheetPage extends StatelessWidget {
  const MonthlyTimesheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(children: [Expanded(child: _buildTimesheet(context))]),
      ),
    );
  }

  List<List<DateTime?>> _getCalendarDays() {
    final now = DateTime.now();
    final firstDayOfMonth = DateTime(now.year, now.month, 1);
    final lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

    // Find the first Monday (start of week)
    var start = firstDayOfMonth;
    while (start.weekday != DateTime.monday) {
      start = start.subtract(const Duration(days: 1));
    }

    // Find the last Sunday (end of week)
    var end = lastDayOfMonth;
    while (end.weekday != DateTime.sunday) {
      end = end.add(const Duration(days: 1));
    }

    final List<List<DateTime?>> weeks = [];
    var currentWeek = <DateTime?>[];

    var current = start;
    while (current.isBefore(end.add(const Duration(days: 1)))) {
      if (current.isBefore(firstDayOfMonth) ||
          current.isAfter(lastDayOfMonth)) {
        currentWeek.add(null);
      } else {
        currentWeek.add(current);
      }

      if (currentWeek.length == 7) {
        weeks.add(currentWeek);
        currentWeek = <DateTime?>[];
      }

      current = current.add(const Duration(days: 1));
    }

    return weeks;
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    if (date.day == 1) {
      return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}';
    }
    return date.day.toString().padLeft(2, '0');
  }

  Widget _buildTimesheet(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [_buildCalendarHeader(), _buildCalendarBody(context)],
      ),
    );
  }

  Widget _buildCalendarHeader() {
    final days = ['T.2', 'T.3', 'T.4', 'T.5', 'T.6', 'T.7', 'CN'];
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        color: Colors.white,
        child: Row(
          children: days
              .map(
                (day) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(1),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      color: Colors.grey[50],
                      child: Text(
                        day,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _buildCalendarBody(BuildContext context) {
    final weeks = _getCalendarDays();
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    return Container(
      color: Colors.white,
      child: Column(
        children: weeks.map((week) {
          final dates = week.map((date) => _formatDate(date)).toList();
          final hours = List.generate(7, (index) {
            final date = week[index];
            if (date == null) return '';

            if (date.weekday >= 6) return 'N';

            // Ngày đặc biệt giữ nguyên giá trị
            if (dates[index] == '01' || dates[index] == '02') return '1L';
            if (dates[index] == '08') return '0.97';
            if (dates[index] == '09') return '0.44';

            // Ngày thường: đã qua hiện 1, chưa đến hiện 0
            final currentDate = DateTime(date.year, date.month, date.day);
            return currentDate.isBefore(today) ? '1' : '0';
          });

          final textColors = List.generate(7, (index) {
            if (week[index] == null) return Colors.grey;
            if (dates[index] == '01' ||
                dates[index] == '02' ||
                dates[index] == '08')
              return Colors.red;
            return Colors.black;
          });

          final bgColors = List.generate(7, (index) {
            if (week[index] == null) return null;
            if (dates[index] == '03' ||
                dates[index] == '04' ||
                dates[index] == '05') {
              return Colors.green[100];
            }
            if (dates[index] == '09') {
              return Colors.blue[100];
            }
            return null;
          });

          return _buildWeek(context, dates, hours, textColors, bgColors);
        }).toList(),
      ),
    );
  }

  Widget _buildWeek(
    BuildContext context,
    List<String> dates,
    List<String> hours,
    List<Color> textColors, [
    List<Color?>? bgColors,
  ]) {
    return Row(
      children: List.generate(7, (index) {
        return Expanded(
          child: Container(
            // height: 120,
            height: MediaQuery.of(context).size.height / 7.6,
            decoration: BoxDecoration(
              color: bgColors?[index] ?? Colors.transparent,
              border: Border.all(color: Colors.grey[100]!),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 20),
                  child: Text(
                    dates[index],
                    style: TextStyle(color: textColors[index], fontSize: 14),
                  ),
                ),
                Text(
                  hours[index],
                  style: TextStyle(color: textColors[index], fontSize: 14),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
*/


import 'package:demo_1office/features/presentation/timesheet/widget/timekeeping_info_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';

class MonthlyTimesheet extends StatelessWidget {
  const MonthlyTimesheet({super.key});

  @override
  Widget build(BuildContext context) {
    // Lấy controller từ CalendarControllerProvider đã bọc ở main.dart
    final controller = CalendarControllerProvider.of<Object?>(context).controller;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            _buildCalendarHeader(),
            Expanded(
              child: MonthView<Object?>(
                controller: controller,
                hideDaysNotInMonth: true,
                headerBuilder: (date) => const SizedBox.shrink(),
                // ẩn header mặc định vì ta dùng header custom
                weekDayBuilder: (day) => const SizedBox(),
                // cellBuilder cần đúng chữ ký: (DateTime, List<CalendarEventData<T>>, bool, bool, bool)
                cellBuilder: _customCell,
                // onCellTap nhận (events, date)
                onCellTap: (events, date) {
                  /*_showDayDialog(context, date, events);*/
                  showTimekeepingInfoBottomSheet(context, date);
                },
                // nếu muốn ẩn các ngày không trong tháng, có thể bật hideDaysNotInMonth
                // hideDaysNotInMonth: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarHeader() {
    final days = ['T.2', 'T.3', 'T.4', 'T.5', 'T.6', 'T.7', 'CN'];
    return Container(
      color: Colors.white,
      child: Row(
        children: days
            .map(
              (day) => Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              color: Colors.grey[50],
              child: Text(
                day,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        )
            .toList(),
      ),
    );
  }

  /// CHÚ Ý: chữ ký chính xác — không có BuildContext ở đây
  Widget _customCell(
      DateTime date,
      List<CalendarEventData<Object?>> events,
      bool isToday,
      bool isInMonth,
      bool hideDaysNotInMonth,
      ) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final currentDate = DateTime(date.year, date.month, date.day);

    // Label ngày (nếu là ngày 1 thì hiển thị dd/MM)
    final dateLabel = date.day == 1
        ? '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}'
        : date.day.toString().padLeft(2, '0');

    // Logic giờ công (giữ nguyên từ code của bạn)
    String workValue;
    if (date.weekday >= 6) {
      workValue = 'N';
    } else if (date.day == 1 || date.day == 2) {
      workValue = '1L';
    } else if (date.day == 8) {
      workValue = '0.97';
    } else if (date.day == 9) {
      workValue = '0.44';
    } else {
      workValue = currentDate.isBefore(today) ? '1' : '0';
    }

    // Màu chữ
    Color textColor = Colors.black;
    if (!isInMonth) textColor = Colors.grey;
    if ([1, 2, 8].contains(date.day)) textColor = Colors.red;

    // Màu nền theo rule cũ
    Color? bgColor;
    if ([3, 4, 5].contains(date.day)) {
      bgColor = Colors.green[100];
    } else if (date.day == 9) {
      bgColor = Colors.blue[100];
    }

    return Container(
      decoration: BoxDecoration(
        color: bgColor ?? Colors.transparent,
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 14),
                child: Text(
                  dateLabel,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 13,
                    fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
              Text(
                workValue,
                style: TextStyle(color: textColor, fontSize: 13),
              ),
            ],
          ),

          // hiện chấm nhỏ nếu có events
          if (events.isNotEmpty)
            const Positioned(
              bottom: 6,
              left: 0,
              right: 0,
              child: Center(
                child: SizedBox(
                  width: 7,
                  height: 7,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.purple, shape: BoxShape.circle),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _showDayDialog(
      BuildContext context,
      DateTime date,
      List<CalendarEventData<Object?>> events,
      ) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Ngày ${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}'),
        content: Text('Số sự kiện: ${events.length}'),
        actions: [
          TextButton(
            onPressed: () {
              // thêm 1 sự kiện mẫu cho ngày này
              final controller = CalendarControllerProvider.of<Object?>(context).controller;
              controller.add(
                CalendarEventData<Object?>(
                  date: DateTime(date.year, date.month, date.day),
                  title: 'Sự kiện từ dialog',
                  startTime: DateTime(date.year, date.month, date.day, 14),
                  endTime: DateTime(date.year, date.month, date.day, 15),
                ),
              );
              Navigator.of(ctx).pop();
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Đã thêm sự kiện')));
            },
            child: const Text('Thêm sự kiện'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Đóng'),
          ),
        ],
      ),
    );
  }
}

