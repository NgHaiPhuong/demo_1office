import 'package:flutter/material.dart';

class CreateSingleWordsPage extends StatelessWidget {
  const CreateSingleWordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Tạo mới đơn từ')),
      body: SafeArea(
        child: Column(
          children: [
            _buildTitle(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildCardCreateSingleWord(
                      Icons.beach_access_outlined,
                      Colors.purple,
                      Colors.purple[50]!,
                      'Đơn xin nghỉ',
                      'Đơn xin nghỉ phát sinh khi bạn muốn nghỉ nhiều ngày làm việc',
                    ),
                    _buildCardCreateSingleWord(
                      Icons.person_outline,
                      Colors.blue,
                      Colors.blue[50]!,
                      'Đơn vắng mặt',
                      'Đơn vắng mặt phát sinh khi bạn có nhu cầu vắng mặt 1 khoảng thời gian trong ca làm việc',
                    ),
                    _buildCardCreateSingleWord(
                      Icons.star_border_outlined,
                      Colors.orange,
                      Colors.orange[50]!,
                      'Đơn làm thêm',
                      'Đơn làm thêm phát sinh khi bạn có khoảng thời gian làm thêm không nằm trong ca làm việc',
                    ),
                    _buildCardCreateSingleWord(
                      Icons.check_circle_outline,
                      Colors.red,
                      Colors.red[50]!,
                      'Đơn checkin/out',
                      'Đơn checkin/out phát sinh khi bạn quên chấm công lúc đến hoặc lúc về',
                    ),
                    _buildCardCreateSingleWord(
                      Icons.sticky_note_2_outlined,
                      Colors.blue,
                      Colors.blue[50]!,
                      'Đơn tăng ca',
                      'Đơn tăng ca phát sinh khi bạn có nhu cầu làm thêm một ca nào đó ngoài ca làm việc đã được phân',
                    ),
                    _buildCardCreateSingleWord(
                      Icons.directions_car_filled_outlined,
                      Colors.lightGreen,
                      Colors.lightGreen[50]!,
                      'Đơn công tác',
                      'Đơn công tác phát sinh khi bạn được yêu cầu đi công tác và không thể chấm công trên công ty',
                    ),
                    _buildCardCreateSingleWord(
                      Icons.timer_outlined,
                      Colors.blue,
                      Colors.blue[50]!,
                      'Đơn làm theo chế độ',
                      'NĐơn làm theo chế độ phats sinh khi bạn được hưởng chế độ đi muộn - về sớm',
                    ),
                    _buildCardCreateSingleWord(
                      Icons.person_remove_outlined,
                      Colors.red,
                      Colors.red[50]!,
                      'Đơn thôi việc',
                      'Đơn thôi việc phát sinh khi bạn nghỉ việc',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        color: Colors.green[50],
        child: Text(
          'Tạo mới đơn từ',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildCardCreateSingleWord(
    IconData icon,
    Color iconColor,
    Color circleColor,
    String title,
    String content, [
    VoidCallback? onTap,
  ]) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.grey, width: 1),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: circleColor,
                radius: 30,
                child: Icon(icon, color: iconColor, size: 40),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      content,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
