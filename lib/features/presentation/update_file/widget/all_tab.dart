import 'package:demo_1office/core/utils/no_data.dart';
import 'package:flutter/material.dart';

class AllUpdateFileTab extends StatefulWidget {
  const AllUpdateFileTab({super.key});

  @override
  State<AllUpdateFileTab> createState() => _AllUpdateFileTab();
}

class _AllUpdateFileTab extends State<AllUpdateFileTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NoData(message: "Không tìm thấy kết quả nào"),
        SizedBox(height: 18),
      ],
    );
  }
}
