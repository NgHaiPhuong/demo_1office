import '../../home/widget/home_header.dart';
import 'package:flutter/material.dart';
import '../../individual/page/individual_bottomsheet.dart';

class SingleWordPage extends StatelessWidget {
  const SingleWordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            const HomeHeader(userName: 'Bảng công toàn bộ'),
          ],
        ),
      ),
      bottomNavigationBar: _buildNavigationBar(context),
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
            // showCategoryBottomSheet(context);
          }),
          _buildItemNavigationBar(Icons.date_range_rounded, 'Chọn tháng',(){
            // showSelectMonthBottomSheet(context);
          }),
          _buildItemNavigationBar(Icons.person_outline, 'Cá nhân', () {
            showIndividualBottomSheet(context);
          }),
        ],
      ),
    );
  }

  Widget _buildItemNavigationBar(IconData icon, String label,
      [VoidCallback? onTap]) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: 30),
          Text(label, style: TextStyle(fontSize: 12))
        ],
      ),
    );
  }
}
