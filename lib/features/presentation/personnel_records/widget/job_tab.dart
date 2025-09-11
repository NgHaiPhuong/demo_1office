
import 'package:demo_1office/core/utils/header.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/data.dart';
import '../../../../core/utils/workprocess_tile.dart';

class JobTab extends StatefulWidget {
  const JobTab({super.key});

  @override
  State<JobTab> createState() => _JobTab();
}

class _JobTab extends State<JobTab> {
  final jobList = LoadData().jobList;
  final contractList = LoadData().contractList;
  final workProcessList = LoadData().workProcessList;
  List<bool> isExpandedList = [true, true, true, true];

  void expandDetailSalary(int index) {
    setState(() {
      isExpandedList[index] = !isExpandedList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildJob(),
          SizedBox(height: 18),
          _buildContract(),
          SizedBox(height: 18),
          _buildWorkingProcess(),
          SizedBox(height: 18),
        ],
      ),
    );
  }

  Widget _buildWorkingProcess() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitle(title: "Quy trình làm việc", isExpand: isExpandedList[2], onTap: () {
            expandDetailSalary(2);
          }),
          _buildListProcess(),
        ],
      ),
    );
  }

  Widget _buildListProcess() {
    return Visibility(
      visible: isExpandedList[2],
      maintainSize: false,
      maintainAnimation: false,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        itemCount: workProcessList.length,
        itemBuilder: (context, index) {
          return WorkProcessTile(
            item: workProcessList[index],
            isFirst: index == 0,
            isLast: index == workProcessList.length - 1,
          );
        },
      ),
    );
  }

  Widget _buildContract() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitle(title: "Danh sách hợp đồng", isExpand: isExpandedList[1], onTap: () {
            expandDetailSalary(1);
          }),
          _buildTable(),
        ],
      ),
    );
  }

  Widget _buildTable() {
    return Visibility(
      visible: isExpandedList[1],
      maintainSize: false,
      maintainAnimation: false,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor:
          WidgetStateProperty.all(Colors.white), // màu header
          border: TableBorder.all(color: Colors.grey.shade200),
          columns: const [
            DataColumn(label: Text("Người tạo", style: TextStyle(color: Colors.black54, fontSize: 16))),
            DataColumn(label: Text("Mã HD", style: TextStyle(color: Colors.black54, fontSize: 16))),
            DataColumn(label: Text("Tên hợp đồng", style: TextStyle(color: Colors.black54, fontSize: 16))),
            DataColumn(label: Text("Phòng ban", style: TextStyle(color: Colors.black54, fontSize: 16))),
            DataColumn(label: Text("Tình trạng", style: TextStyle(color: Colors.black54, fontSize: 16))),
            DataColumn(label: Text("Ngày ký", style: TextStyle(color: Colors.black54, fontSize: 16))),
            DataColumn(label: Text("Hiệu lực từ ngày", style: TextStyle(color: Colors.black54, fontSize: 16))),
            DataColumn(label: Text("Đến ngày", style: TextStyle(color: Colors.black54, fontSize: 16))),
            DataColumn(label: Text("Ngày tạo", style: TextStyle(color: Colors.black54, fontSize: 16))),
          ],
          rows: contractList
              .map(
                (e) => DataRow(cells: [
              DataCell(Text(e.creator)),
              DataCell(Text(e.idContract)),
              DataCell(Text(e.nameContract)),
              DataCell(Text(e.departments)),
              DataCell(Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Text(e.status, style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold))
              )),
              DataCell(Text(e.signingDate)),
              DataCell(Text(e.effectiveDate)),
              DataCell(Text(e.toDate)),
              DataCell(Text(e.creationDate)),
            ]),
          ).toList(),
        ),
      ),
    );
  }

  Widget _buildJob() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitle(title: "Công việc", isExpand: isExpandedList[0], onTap: () {
            expandDetailSalary(0);
          }),
          _buildContentJob(),
        ],
      ),
    );
  }

  Widget _buildContentJob() {
    return Visibility(
      visible: isExpandedList[0],
      maintainSize: false,
      maintainAnimation: false,
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        itemCount: jobList.length,
        itemBuilder: (context, index) {
          final item = jobList[index];

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Label
                Expanded(
                  flex: 2,
                  child: Text(
                    item.label,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(width: 18),
                // Value
                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: item.isHighlighted
                          ? const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
                          : EdgeInsets.zero,
                      decoration: BoxDecoration(
                        color: item.isHighlighted
                            ? Colors.green.withValues(alpha: 0.1)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        item.value,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          color: item.isHighlighted ? Colors.green.shade800 : Colors.black87,
                          fontWeight: item.isHighlighted ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}