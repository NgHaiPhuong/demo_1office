
import 'package:flutter/material.dart';

class NoData extends StatelessWidget {

  const NoData({super.key});

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
          Text("Không tìm thấy kết quả nào", style: TextStyle(color: Colors.grey, fontSize: 16))
        ],
      ),
    );
  }
}
