
import 'package:flutter/material.dart';

import '../../../../core/utils/data.dart';
import '../../../../core/utils/header.dart';
import '../../../data/models/infoIitem.dart';
import 'general_info_widget.dart';

class VitaeTab extends StatefulWidget {
  const VitaeTab({super.key});

  @override
  State<VitaeTab> createState() => _VitaeTab();
}

class _VitaeTab extends State<VitaeTab> {
  final infoList = LoadData().infoList;
  final idNumberList = LoadData().idNumberList;
  final dataBank = LoadData().accountData;
  final familyData = LoadData().familyData;
  final generalList = LoadData().generalItems;

  List<bool> isExpandedList = [true, true, true, true, true];

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
          _buildInfo(),
          SizedBox(height: 18),
          _buildCCCD(),
          SizedBox(height: 18),
          _buildBank(),
          SizedBox(height: 18),
          _buildFamilyInfo(),
          SizedBox(height: 18),
          _buildPersonnelInformation(),
          SizedBox(height: 18),
          _buildImageIdNumber(),
          SizedBox(height: 18),
        ],
      ),
    );
  }

  Widget _buildImageIdNumber() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitle(title: "Ảnh CCCD", isExpand: isExpandedList[4], onTap: () {
            expandDetailSalary(4);
          }),
          _buildContentId(),
        ],
      ),
    );
  }

  Widget _buildContentId() {
    return Visibility(
      visible: isExpandedList[4],
      maintainSize: false,
      maintainAnimation: false,
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildItemId("Ảnh CC/CCCD/CMND mặt trước"),
            SizedBox(height: 32),
            _buildItemId("Ảnh CC/CCCD/CMND mặt sau"),
            SizedBox(height: 32),
            _buildItemId("Ảnh hộ chiếu"),
          ],
        ),
      ),
    );
  }

  Widget _buildItemId(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 220,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.orange.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Center(
            child: IconButton(
              icon: const Icon(Icons.add_a_photo, size: 40, color: Colors.grey),
              onPressed: () {
                // TODO: handle upload ảnh (dùng ImagePicker)
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPersonnelInformation() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBasicInformation(),
          Text(
            "Thông tin nhân sự",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          GeneralInfo(generalList: generalList),
        ],
      ),
    );
  }

  Widget _buildBasicInformation() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.orange.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.grey, size: 80),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Nguyễn Thị Hải Phương",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Fresher Android",
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    "Mã 524/524",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    "DIV1",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Text(
                      "Đang làm việc",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFamilyInfo() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitle(title: "Thông tin gia đình & người phụ thuộc", isExpand: isExpandedList[3], onTap: () {
            expandDetailSalary(3);
          }),
          _buildTable(false),
        ],
      ),
    );
  }

  Widget _buildBank() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitle(title: "Ngân hàng", isExpand: isExpandedList[2], onTap: () {
            expandDetailSalary(2);
          }),
          _buildTable(true),
        ],
      ),
    );
  }

  Widget _buildTable(bool isBank) {
    return Visibility(
      visible: isExpandedList[isBank ? 2 : 3],
      maintainSize: false,
      maintainAnimation: false,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor:
          WidgetStateProperty.all(Colors.white), // màu header
          border: TableBorder.all(color: Colors.grey.shade200),
          columns: isBank ? const [
            DataColumn(label: Text("Số tài khoản", style: TextStyle(color: Colors.black54, fontSize: 16))),
            DataColumn(label: Text("Tên tài khoản", style: TextStyle(color: Colors.black54, fontSize: 16))),
            DataColumn(label: Text("Ngân hàng", style: TextStyle(color: Colors.black54, fontSize: 16))),
            DataColumn(label: Text("Chi nhánh", style: TextStyle(color: Colors.black54, fontSize: 16))),
          ] : const [
            DataColumn(label: Text("Họ và tên", style: TextStyle(color: Colors.black54, fontSize: 16))),
            DataColumn(label: Text("Số điện thoại", style: TextStyle(color: Colors.black54, fontSize: 16))),
            DataColumn(label: Text("Mã số thuế", style: TextStyle(color: Colors.black54, fontSize: 16))),
            DataColumn(label: Text("Số CCCD/DDCN", style: TextStyle(color: Colors.black54, fontSize: 16))),
            DataColumn(label: Text("Ngày cấp", style: TextStyle(color: Colors.black54, fontSize: 16))),
            DataColumn(label: Text("Nơi cấp", style: TextStyle(color: Colors.black54, fontSize: 16))),
            DataColumn(label: Text("Phụ thuộc", style: TextStyle(color: Colors.black54, fontSize: 16))),
            DataColumn(label: Text("Thời gian phụ thuộc", style: TextStyle(color: Colors.black54, fontSize: 16))),
            DataColumn(label: Text("Ghi chú", style: TextStyle(color: Colors.black54, fontSize: 16))),
          ],
          rows: isBank ? dataBank
              .map(
                (e) => DataRow(cells: [
              DataCell(Text(e.accountNumber)),
              DataCell(Text(e.accountName)),
              DataCell(Text(e.bank)),
              DataCell(Text(e.branch)),
            ]),
          ).toList() : familyData
              .map(
                (e) => DataRow(cells: [
              DataCell(Text(e.name)),
              DataCell(Text(e.phone)),
              DataCell(Text(e.taxCode)),
              DataCell(Text(e.idNumber)),
              DataCell(Text(e.date)),
              DataCell(Text(e.place)),
              DataCell(Text(e.dependency)),
              DataCell(Text(e.time)),
              DataCell(Text(e.note)),
            ]),
          ).toList(),
        ),
      ),
    );
  }

  Widget _buildCCCD() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitle(title: "Thông tin CMT/CC/CCCD/Hộ chiếu", isExpand: isExpandedList[1], onTap: () {
            expandDetailSalary(1);
          }),
          _buildListInfo(idNumberList, 1),
        ],
      ),
    );
  }

  Widget _buildInfo() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitle(title: "Thông tin", isExpand: isExpandedList[0], onTap: () {
            expandDetailSalary(0);
          }),
          _buildListInfo(infoList, 0),
        ],
      ),
    );
  }

  Widget _buildListInfo(List<InfoItem> list, int index) {
    return Visibility(
      visible: isExpandedList[index],
      maintainSize: false,
      maintainAnimation: false,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _buildInfoRow(list[index]);
        },
      ),
    );
  }

  Widget _buildInfoRow(InfoItem item) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: Text(
              item.title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              item.value.isNotEmpty ? item.value : "--",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}