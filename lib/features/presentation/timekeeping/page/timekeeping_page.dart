import '../../home/widget/home_header.dart';
import 'package:flutter/material.dart';


class TimekeepingPage extends StatefulWidget {
  const TimekeepingPage({super.key});

  @override
  State<TimekeepingPage> createState() => _TimekeepingPageState();
}

class _TimekeepingPageState extends State<TimekeepingPage> {
  DateTime? fromDate;
  DateTime? toDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            const HomeHeader(userName: 'Chấm công GPS/Wifi'),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 1),
                    Image.asset('assets/images/check_in.png',width: double.infinity,),
                    _buildButton('CHẤM CÔNG GPS'),
                    _buildButton('CHẤM CÔNG WIFI', Colors.grey),
                    _buildTimeCheckIn(),
                    _buildContent(),
                    _buildDateTime(),
                    _buildTimeRange(),
                    _buildTimeRange(),
                    _buildTimeRange(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildNavigationBar(context),
    );
  }

  Widget _buildButton( String label, [Color? color]) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.white,
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.deepOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Text(
           label,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildTimeCheckIn(){
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Center(child: Text('Chốt gần nhất: 08:29 15/09/2025 - Máy chấm công',)),
    );
  }

  Widget _buildContent(){
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('CA HÀNH CHÍNH', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                SizedBox(width: 4),
                Icon(Icons.error_outline, size: 20, color: Colors.orange),
                Spacer(),
                Icon(Icons.access_time, size: 20, color: Colors.grey),
                SizedBox(width: 4),
                Text('15/09/2025', style: TextStyle(fontSize: 16, color: Colors.grey)),
              ],
            ),
            Text('Bảng công toàn bộ công ty', style: TextStyle(fontSize: 14, color: Colors.grey)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.access_time_filled, color: Colors.orange,),
                SizedBox(width: 8),
                Text('08:30 - 18:00')
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.where_to_vote_rounded, color: Colors.green,),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('62 Trần Phú'),
                    Text('Bán kính 200m', style: TextStyle(fontSize: 14, color: Colors.grey)),
                    SizedBox(height: 8),
                    Text('Albox'),
                    Text('Bán kính 200m', style: TextStyle(fontSize: 14, color: Colors.grey)),
                    Text('Xem thêm', style: TextStyle(fontSize: 14, color: Colors.red)),
                  ],
                )
              ],
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildDateTime() {
    final days = [
      {'label': 'T2', 'day': '15'},
      {'label': 'T3', 'day': '16'},
      {'label': 'T4', 'day': '17'},
      {'label': 'T5', 'day': '18'},
      {'label': 'T6', 'day': '19'},
      {'label': 'T7', 'day': '20'},
      {'label': 'CN', 'day': '21'},
    ];
    return Container(
      color: Colors.white,
      height: 100,
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final isSelected = index == 0;
          return Container(
            width: 45,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? Colors.deepOrange : Colors.transparent,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(35),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  days[index]['label']!,
                  style: TextStyle(
                    fontSize: 13,
                    color: isSelected ? Colors.deepOrange : Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  days[index]['day']!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                if (isSelected)
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTimeRange() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  const Text('08:29', style: TextStyle(fontSize: 14)),
                  const SizedBox(height: 4),
                  Text('GPS', style: const TextStyle(fontSize: 14, color: Colors.grey)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  width: 2,
                  height: 40,
                  color: Colors.green,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('TERACOM', style: TextStyle(fontSize: 14)),
                  const SizedBox(height: 4),
                  Text('Khoảng cách: 35m - Bánh kính: 50m', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ]),
          SizedBox(height: 5),
          Divider(),
        ],
      ),
    );
  }

  Widget _buildNavigationBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6),
      height: 80,
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildItemNavigationBar(Icons.menu, 'Danh mục', () {
          }),
          _buildItemNavigationBar(Icons.date_range_rounded, 'Chọn tháng', () {
          }),
          _buildItemNavigationBar(Icons.person_outline, 'Cá nhân', () {
          }),
        ],
      ),
    );
  }

  Widget _buildItemNavigationBar(IconData icon, String label,
      [VoidCallback? onTap,Color? color]) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: 30, color: color ?? Colors.black),
          Text(label, style: TextStyle(fontSize: 12))
        ],
      ),
    );
  }
}
