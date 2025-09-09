import 'package:flutter/material.dart';

class StatisticalPage extends StatelessWidget {
  const StatisticalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildAllContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 1),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Text('Thống kê T9, 2025', style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }

  Widget _buildAllContent() {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: _buildBoxContent(
                      Icons.date_range,
                      Colors.green,
                      Colors.green[50]!,
                      'Công thực tế',
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: _buildBoxContent(
                      Icons.access_time,
                      Colors.blue,
                      Colors.blue[50]!,
                      'Giờ làm thực tế',
                    ),
                  ),
                ],
              ),
              _buildTitleContent(),
              _buildContent('Công làm việc', '22'),
              _buildContent('Giờ làm việc thực tính', '52'),
              _buildContent('Số công chuẩn', '22'),
              _buildContent('Số lần đi muộn', '2'),
              _buildContent('Số lần về sớm', '0'),
              _buildContent('Số phút đi muộn', '22'),
              _buildContent('Số phút về sớm', '0'),
              _buildContent('Số công nghỉ không lý do', '0'),
              _buildContent('Số lần quên check in/out', '0'),
              _buildContent('Giờ làm việc thực tính ban đêm', '22'),
              _buildContent('Giờ làm việc thực tính ban ngày', '22'),
              _buildContent('Công làm thêm', '0'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBoxContent(
    IconData icon,
    Color iconColor,
    Color bgColor,
    String content,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Icon(icon, color: iconColor, size: 30),
          ),
          SizedBox(height: 16),
          Text(content, style: TextStyle(fontSize: 18, color: Colors.grey)),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('6.4/', style: TextStyle(fontSize: 18)),
              Text('22', style: TextStyle(fontSize: 18, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTitleContent(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Container(
            color: Colors.white,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.blue[50]!,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Icon(Icons.timer_outlined, color: Colors.blue, size: 30),
                ),
                SizedBox(width: 16),
                Text('Công làm việc', style: TextStyle(fontSize: 18))
              ],
            ),
          ),
        ),
        Divider(),
      ],
    );
  }

  Widget _buildContent(String title, String value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4),
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(fontSize: 18,color: Colors.grey)),
              Text(value, style: TextStyle(fontSize: 18)),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
