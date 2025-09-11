import '../../create_single_words/page/create_single_words_page.dart';
import '../../home/widget/home_header.dart';
import 'package:flutter/material.dart';
import '../widget/category_bottomsheet.dart';
import '../widget/export_bottomsheet.dart';
import '../widget/fast_filter_bottomsheet.dart';
import '../widget/filter_top.dart';
import '../widget/search_bottomsheet.dart';

class SingleWordPage extends StatelessWidget {
  const SingleWordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            const HomeHeader(userName: 'Danh sách đơn từ'),
            _buildNumberOfSingleWords(context),
            Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildCardSingleWord('Đơn xin nghỉ', 'Nghỉ ốm'),
                      _buildCardSingleWord('Đơn xin nghỉ', 'Nghỉ việc riêng'),
                      _buildCardSingleWord('Đơn checkin/out', 'Ngủ quên'),
                      _buildCardSingleWord('Đơn checkin/out', 'Tắc đường'),
                      _buildCardSingleWord('Đơn checkin/out', 'Nghỉ việc riêng'),
                      _buildCardSingleWord('Đơn checkin/out','Nghỉ việc riêng'),

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

  Widget _buildNumberOfSingleWords(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'Tất cả (26)',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){showFilterTopBottomSheet(context);},
                child: Icon(Icons.filter_list)),
          ],
        ),
      ),
    );
  }

  Widget _buildCardSingleWord(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 20,
                  child: Text(
                    'O',
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: TextStyle(fontSize: 20)),
                      Row(
                        children: [
                          Text(
                            'Nguyễn Thị Hải Phương ',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          const Icon(
                            Icons.access_time,
                            color: Colors.grey,
                            size: 16,
                          ),
                          Flexible(
                            child: Text(
                              ' 08:50 ng 3/9/2025',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      _buildContent(
                        Text(
                          content,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(Widget content) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            'Lý do',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
        Flexible(
          flex: 3,
          fit: FlexFit.loose,
          child: Align(alignment: Alignment.centerLeft, child: content),
        ),
      ],
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
            showCategorySingleWordBottomSheet(context);
          }),
          _buildItemNavigationBar(Icons.search, 'Tìm kiếm', () {
            showSearchBottomSheet(context);
          }),
          _buildItemNavigationBar(Icons.add_box_outlined, 'Tạo mới',(){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CreateSingleWordsPage()),
            );
          }, Colors.lightGreen),
          _buildItemNavigationBar(Icons.filter_alt_outlined, 'Lọc nhanh', () {
            showFastFilterBottomSheet(context);
          }),
          _buildItemNavigationBar(Icons.logout_outlined, 'Export', () {
            showExportBottomSheet(context);
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
