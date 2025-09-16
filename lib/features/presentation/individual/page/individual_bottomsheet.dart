import 'package:flutter/material.dart';
import '../../../../core/utils/functional_item.dart';
import '../../account/page/account_page.dart';
import '../../log_in/page/log_in_page.dart';
import '../../timekeeping/page/timekeeping_page.dart';

void showIndividualBottomSheet(BuildContext context) {
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
          border: Border(top: BorderSide(color: Color(0xFFE0E0E0), width: 1)),
        ),
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeaderBottomSheet(),
              Divider(),
              _buildContentBottomSheet(context),
              Divider(),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[50],
                    radius: 22,
                    child: Icon(Icons.check),
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Thiết bị của bạn đã được xác thực',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildHeaderBottomSheet() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CircleAvatar(
        backgroundColor: Colors.red,
        radius: 30,
        child: Text(
          'O',
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nguyễn Thị Hải Phương',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.shopping_bag_outlined, size: 24, color: Colors.grey),
                SizedBox(width: 4),
                Text(
                  'DIV1',
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.account_box_outlined, size: 24, color: Colors.grey),
                SizedBox(width: 4),
                Text(
                  'Fresher Android',
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _buildContentBottomSheet(BuildContext context) {
  return SizedBox(
    height: 400,
    child: SingleChildScrollView(
      child: Column(
        children: [
          FunctionItem(
            icon: Icons.person_outlined,
            text: 'Tài khoản',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AccountPage()),
              );
            },
          ),
          FunctionItem(icon: Icons.library_books_outlined, text: 'Hướng dẫn'),
          FunctionItem(
            icon: Icons.paid_outlined,
            text: 'Ứng lương 1OFFICE',
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          FunctionItem(
            icon: Icons.lock_outline,
            text: 'Smart OTP',
            showBadge: true,
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          FunctionItem(
            icon: Icons.location_on_outlined,
            text: 'Chấm công GPS/Wifi',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TimekeepingPage()),
              );
            },
          ),
          FunctionItem(icon: Icons.style, text: 'Màu giao diện'),
          FunctionItem(
            icon: Icons.g_translate_outlined,
            text: 'Ngôn ngữ',
            showLanguage: true,
          ),
          FunctionItem(
            backgroundColor: Colors.yellow[50]!,
            icon: Icons.card_giftcard,
            iconColor: Colors.orange,
            text: 'Giới thiệu 1Office',
            textColor: Colors.orange,
          ),
          FunctionItem(icon: Icons.lock_outline, text: 'Đổi mật khẩu'),
          FunctionItem(
            icon: Icons.logout_outlined,
            iconColor: Colors.red,
            text: 'Đăng xuất',
            textColor: Colors.red,
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => LogInPage()));
            },
          ),
        ],
      ),
    ),
  );
}
