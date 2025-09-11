import 'package:flutter/material.dart';

class Security extends StatelessWidget {
  const Security({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTwoFactorAuth(),
              _buildContactInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTwoFactorAuth() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
                child: Icon(Icons.local_police,size: 40, color: Colors.grey[600])),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Bảo mật 2 lớp',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(
                          'Đang tắt',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Yêu cầu bảo mật 2 lớp khi bạn đăng nhập, đổi mật khẩu, truy cập bảng lương cá nhân..',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      'BẬT BẢO MẬT',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Phương thức xác thực',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              Text('Lịch sử'),
              const SizedBox(width: 4),
              Icon(Icons.history, size: 16, color: Colors.grey[600]),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHistoryItem(
                  Icons.phone_android,
                  'SmartOTP',
                  Icons.warning_amber_rounded,
                  'Thêm thiết bị',
                  Colors.red,
                  showHelpIcon: true,
                ),
                const Divider(height: 32),
              _buildHistoryItem(
                  Icons.mail_outline,
                  'Email',
                  Icons.check_circle_outline,
                  'toilanguyenthihaiphuong@gmail.com',
                  Colors.green
                ),
                const Divider(height: 32),
              _buildHistoryItem(
                  Icons.sms_outlined,
                  'Zalo/SMS',
                  Icons.check_circle_outline,
                  '0987898986',
                  Colors.green
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildHistoryItem(IconData iconTitle,String title,IconData iconContent,String content, Color iconColor,{
    bool showHelpIcon = false,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(iconTitle),
                SizedBox(width: 12),
                Text(title),
                SizedBox(width: 12),
                if (showHelpIcon)
                Icon(Icons.help_outline, size: 16, color: Colors.orange),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Icon(iconContent, color: iconColor),
                SizedBox(width: 12),
                Expanded(child: Text(content)),
                SizedBox(width: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
