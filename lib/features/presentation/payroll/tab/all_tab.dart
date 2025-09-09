import 'package:flutter/material.dart';

class AllTab extends StatefulWidget {
  const AllTab({super.key});

  @override
  State<AllTab> createState() => _AllTab();
}

class _AllTab extends State<AllTab> {
  bool isExpand = true;

  void expandDetailSalary() {
    setState(() {
      isExpand = !isExpand;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.withValues(alpha: 0.055),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSalaryHeader(),
            Visibility(
              visible: isExpand,
              maintainSize: false,
              maintainAnimation: false,
              child: _buildDetailPayroll(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailPayroll() {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        border: BoxBorder.all(width: 0.2, color: Colors.grey),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.description_outlined, size: 50, color: Colors.grey[400]),
            const SizedBox(width: 12),
            Text(
              "Không có bảng lương nào",
              style: TextStyle(fontSize: 16, color: Colors.grey[500]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSalaryHeader() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: BoxBorder.all(width: 0.2, color: Colors.grey),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Danh sách bảng lương 2025",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.calendar_month_outlined, color: Colors.grey),
                onPressed: () {
                  // Xử lý khi bấm vào icon bar chart
                },
              ),
              IconButton(
                icon: Icon(
                  isExpand
                      ? Icons.remove
                      : Icons.check_box_outline_blank_outlined,
                  color: Colors.grey,
                ),
                onPressed: expandDetailSalary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
