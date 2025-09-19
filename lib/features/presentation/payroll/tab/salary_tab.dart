import 'package:flutter/material.dart';

class WorkingSalaryTab extends StatefulWidget {
  const WorkingSalaryTab({super.key});

  @override
  State<WorkingSalaryTab> createState() => _WorkingSalaryTab();
}

class _WorkingSalaryTab extends State<WorkingSalaryTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      child: ListView(
        shrinkWrap: true,
        children: [
          _buildItem("Chức vụ", "0",index:  "4"),
          _buildItem("Ngày vào chính thức công ty", "0",index:  "5"),
          _buildItem("Tên hợp đồng", "Hợp đồng thử việc",index:  "6"),
          _buildItem("Số công chuẩn", "21",index:  "7"),
          _buildItem("Công thực tế tính lương", "19",index:  "8"),
          _buildItem("Công thường", "19",index:  "9"),
          _buildItem("Công lễ", "19", index: "10"),
          _buildItem("Số công nghỉ phép", "0", index: "11"),
          _buildItem("Công R", "0", index: "12"),
          _buildItem("Công OS", "0", index: "13"),
          _buildItem("Lương cơ bản đóng BH", "0", index: "14"),
          _buildItem( "Lương cơ bản gross", "100,000,000", index: "15"),
          _buildItem("Tiền phạt đi muộn", "0", index: "16"),
          _buildItem("Tiền phạt về sớm", "0", index: "17"),
          _buildItem("Cấn trừ đi muộn/về sớm", "0", index: "18"),
          _buildItem("Trừ khác", "0", index: "19"),
          _buildItem("Tổng phạt", "0", index: "20"),
          _buildItem("Tổng Lương CB theo ngày công thực tế", "98,000,000"),
          _buildItem("Phụ cấp trách nhiệm", "0"),
          _buildItem("Phụ cấp trách nhiệm", "0"),
          _buildItem("Phụ cấp trách nhiệm thực tính", "0"),
          _buildItem("Phụ cấp gửi xe", "0"),
          _buildItem("Hình thức trả lương OS", "Bình thường"),
          _buildItem("Lương onsite", "1,000,000"),
          _buildItem("Ngày OS", "0"),
          _buildItem("Lương OS", "0"),
          _buildItem("Tổng thu nhập từ lương thực tế, phụ cấp, OS", "98,000,000"),
          _buildItem("Số người phụ thuộc", "0"),
          _buildItem("Số giảm (NPT)", "0"),
          _buildItem("Số giảm (bản thân)", "11,000,000"),
          _buildItem("BHXH (8%)", "0"),
          _buildItem("BHYT (1.5%)", "0"),
          _buildItem("BHTN (1%)", "0"),
          _buildItem("Tổng BHXH trừ lương (10.5%)", "0"),
          _buildItem("BHXH (17%)", "0"),
          _buildItem("BHYT (3%)", "0"),
          _buildItem("BHTN (1%)", "0"),
          _buildItem("Tổng CT chi trả", "0"),
          _buildItem("Tổng CT chi trả", "0"),
          _buildItem("TNTT Thu nhập trước thuế từ tiền lương, phụ cấp, OS", "0"),
          _buildItem("Thuế TNCN từ tiền lương thực tế, phụ cấp, OS", "0"),
          _buildItem("Công làm thêm trước 12h", "0"),
          _buildItem("Công làm thêm sau 12h", "0"),
          _buildItem("Công làm thêm nghỉ lễ", "0"),
          _buildItem("Lương OT", "0"),
          _buildItem("Lương OT", "0"),
          _buildItem("Thuế TNCN từ tiền lương OT", "0"),
          _buildItem("Tổng thu nhập", "98,000,000"),
          _buildItem("Tổng thu nhập chịu thuế", "0"),
          _buildItem("Thuế TNCN từ tiền tổng thu nhập", "10,000,000"),
          _buildItem("Hình thức trả lương cố định", "0"),
          _buildItem("Thuế TNCN bị khấu trừ", "10,000,000"),
          _buildItem("Thuế TNCN từ tiền lương OT", "0"),
          _buildItem("Tổng thu nhập", "98,000,000"),
          _buildItem("Tổng thu nhập chịu thuế", "0"),
          _buildItem("Thuế TNCN từ tiền tổng thu nhập", "10,000,000"),
          _buildItem("Hình thức trả lương cố định", "0"),
          _buildItem("Thuế TNCN bị khấu trừ", "10,000,000"),
          _buildItem("Thực lĩnh", "100,000,000"),
        ],
      ),
    );
  }

  Widget _buildItem(String text, String value, {String index = ""}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                "$index $text",
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                textAlign: TextAlign.end,
                value,
                style: const TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
        const SizedBox(height: 12),
        Divider(color: Colors.grey)
      ],
    );
  }
}