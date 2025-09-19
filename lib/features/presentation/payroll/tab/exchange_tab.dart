
import 'package:demo_1office/core/utils/no_data.dart';
import 'package:flutter/material.dart';

class ExchangeTab extends StatefulWidget {
  const ExchangeTab({super.key});

  @override
  State<ExchangeTab> createState() => _ExchangeTab();
}

class _ExchangeTab extends State<ExchangeTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NoData(message: "Không có thảo luận nào"),
        SizedBox(height: 16),
        buildChatInput(),
      ],
    );
  }

  Widget buildChatInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          // Icon upload
          IconButton(
            icon: Icon(Icons.arrow_circle_up_outlined, color: Colors.grey, size: 28),
            onPressed: () {
              // TODO: xử lý upload
            },
          ),

          // TextField nhập nội dung
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Viết thảo luận...",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),

          // Icon đính kèm
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.lightGreen.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.attach_file, color: Colors.grey),
          ),
          SizedBox(width: 5),

          // Icon gửi
          IconButton(
            icon: Icon(Icons.send, color: Colors.grey),
            onPressed: () {
              // TODO: xử lý gửi
            },
          ),
        ],
      ),
    );
  }
}