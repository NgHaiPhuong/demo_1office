
import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  final String? message;

  const NoData({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 45),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.event_note, size: 50, color: Colors.grey),
          SizedBox(width: 20),
          Text(message ?? "Không tìm thấy kết quả nào", style: TextStyle(color: Colors.grey, fontSize: 16))
        ],
      ),
    );
  }
}
