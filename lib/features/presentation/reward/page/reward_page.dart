import 'package:demo_1office/core/utils/no_data.dart';
import 'package:flutter/material.dart';

class RewardPage extends StatefulWidget {
  const RewardPage({super.key});

  @override
  State<RewardPage> createState() => _RewardPage();
}

class _RewardPage extends State<RewardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Khen thưởng, kỉ luật",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        iconTheme: IconThemeData(color: Colors.grey),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildItem(context, "Quyết định điều chuyển phòng ban"),
            _buildItem(context, "Quyết định khen thuởng", isFilter: true),
            _buildItem(context, "Kỉ luật lao động", isFilter: true),
            _buildItem(context, "Kỉ luật nội bộ", isFilter: true),
            _buildItem(context, "Quyết định bổ nhiệm "),
            _buildItem(context, "Quyết định miễn nhiễm"),
            _buildItem(context, "Quyết định tiếp nhận"),
            _buildItem(context, "Quyết định tăng/giảm lương"),
            _buildItem(context, "Quyết định chấm dứt HĐLĐ"),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(
    BuildContext context,
    String text, {
    bool isFilter = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        if (isFilter) ...[_buildFilter()],
      ],
    );
  }

  Widget _buildFilter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.tune),
          SizedBox(height: 12),
          Divider(color: Colors.grey.shade300),
          NoData(message: "không tìm thấy kết quả nào",)
        ],
      ),
    );
  }
}
