import 'package:demo_1office/features/presentation/personnel_records/widget/general_info_widget.dart';
import 'package:demo_1office/features/presentation/reward/page/reward_page.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/data.dart';
import '../../../../core/utils/header.dart';
import '../../../../core/utils/workprocess_tile.dart';

class PersonnelTab extends StatefulWidget {
  const PersonnelTab({super.key});

  @override
  State<PersonnelTab> createState() => _PersonnelTab();
}

class _PersonnelTab extends State<PersonnelTab> {
  final generalList = LoadData().generalItems;
  final workProcessList = LoadData().workProcessList;
  final documentList = LoadData().documentList;
  final healthList = LoadData().healthList;
  final workList = LoadData().workList;

  List<bool> isExpandedList = [true, true, true, true, true, true, true, true, true];

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
          _buildPersonnelInformation(),
          SizedBox(height: 18),
          _buildWorkingProcess(),
          SizedBox(height: 18),
          _buildProfileProcess(),
          SizedBox(height: 18),
          _buildDebt(),
          SizedBox(height: 18),
          _buildHealthy(),
          SizedBox(height: 18),
          _buildWorkConscious(),
          SizedBox(height: 18),
          _buildWorkEfficiency(),
          SizedBox(height: 18),
          _buildFinance(),
          SizedBox(height: 18),
          _buildReward(),
          SizedBox(height: 18),
          _buildAsset(),
        ],
      ),
    );
  }

  Widget _buildFinance() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitle(
            title: "Tài chính",
            isExpand: isExpandedList[8],
            onTap: () {
              expandDetailSalary(8);
            },
          ),
          _buildContentFinance()
        ],
      ),
    );
  }

  Widget _buildContentFinance() {
    return Visibility(
      visible: isExpandedList[8],
      maintainSize: false,
      maintainAnimation: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFinanceCard(),
          _buildItemFinance()
        ],
      ),
    );
  }

  Widget _buildItemFinance() {
    return Column(
      children: [
        _buildDebtItem(
          title: "Số lượng/ngày",
          amount: "500,000đ",
          icon: Icons.attach_money_outlined,
          iconColor: Colors.green,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 80, right: 16),
          child: Divider(),
        ),
        _buildDebtItem(
          title: "Số lượng/tháng",
          icon: Icons.wallet_outlined,
          amount: "100,000,000đ",
          iconColor: Colors.deepPurple,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 80, right: 16),
          child: Divider(),
        ),
        _buildDebtItem(
          title: "Tổng doanh số",
          icon: Icons.money,
          amount: "0đ",
          iconColor: Colors.blueAccent,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 80, right: 16),
          child: Divider(),
        ),
        _buildDebtItem(
          title: "Doanh số/lương (ROI)",
          icon: Icons.pie_chart_outline_outlined,
          amount: "500,000đ",
          iconColor: Colors.red,
        )
      ],
    );
  }

  Widget _buildFinanceCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orangeAccent.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tổng lương đã nhận của bạn",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              SizedBox(height: 4),
              Text(
                "100,000,000đ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Image.asset("assets/images/salary.png", height: 80),
        ],
      ),
    );
  }

  Widget _buildAsset() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitle(
            title: "Tài sản",
            isExpand: isExpandedList[7],
            onTap: () {
              expandDetailSalary(7);
            },
          ),
          _buildAssetCard(),
        ],
      ),
    );
  }

  Widget _buildAssetCard() {
    return Visibility(
      visible: isExpandedList[7],
      maintainSize: false,
      maintainAnimation: false,
      child: Container(
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.account_balance_wallet,
                  color: Colors.lightGreen,
                  size: 32,
                ),
                const SizedBox(width: 16),
                const Text(
                  "Tổng giá trị",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            // Giá trị
            const Text(
              "0 đ",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.lightGreen,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReward() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitle(
            title: "Khen thưởng, kỉ luật",
            isExpand: isExpandedList[6],
            onTap: () {
              expandDetailSalary(6);
            },
            isMoreIcon: true,
            icon: Icons.open_in_new,
            onTapMoreIcon: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RewardPage(),
                ),
              );
            },
          ),
          _buildRewardCard(),
        ],
      ),
    );
  }

  Widget _buildRewardCard() {
    return Visibility(
      visible: isExpandedList[6],
      maintainSize: false,
      maintainAnimation: false,
      child: Column(
        children: [
          _buildCard(
            icon: Icons.emoji_events_outlined,
            iconColor: Colors.lightGreen,
            title: "Quyết định",
            count: "0 LẦN",
          ),

          const SizedBox(height: 12),

          _buildCard(
            icon: Icons.thumb_down_alt_outlined,
            iconColor: Colors.red,
            title: "Kỷ luật",
            count: "0 LẦN",
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String count,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Row(
        children: [
          // Icon với nền
          Container(
            width: 55,
            height: 55,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 16),

          // Text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                count,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWorkEfficiency() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitle(
            title: "Hiệu quả công việc",
            isExpand: isExpandedList[5],
            onTap: () {
              expandDetailSalary(5);
            },
          ),
          _buildHideAndShow(),
        ],
      ),
    );
  }

  Widget _buildHideAndShow() {
    return Visibility(
      visible: isExpandedList[5],
      maintainSize: false,
      maintainAnimation: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_buildTotalWork(), _buildProgressWork()],
      ),
    );
  }

  Widget _buildTotalWork() {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tổng số công việc của bạn",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              SizedBox(height: 4),
              Text(
                "0 VIỆC",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Image.asset("assets/images/salary.png", height: 80),
        ],
      ),
    );
  }

  Widget _buildProgressWork() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          _buildProgressItem(
            color: Colors.lightGreen,
            icon: Icons.favorite_border,
            label: "Hoàn thành trước hạn",
            value: 0.0,
          ),
          _buildProgressItem(
            color: Colors.blue,
            icon: Icons.check_circle_outline,
            label: "Hoàn thành đúng hạn",
            value: 0.0,
          ),
          _buildProgressItem(
            color: Colors.orange,
            icon: Icons.warning_amber_outlined,
            label: "Hoàn thành quá hạn",
            value: 0.0,
          ),
          _buildProgressItem(
            color: Colors.red,
            icon: Icons.cancel_outlined,
            label: "Chưa hoàn thành",
            value: 0.0,
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildProgressItem({
    required Color color,
    required IconData icon,
    required String label,
    required double value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          // Icon tròn nền màu
          Container(
            width: 55,
            height: 55,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 26),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    LinearProgressIndicator(
                      value: value,
                      minHeight: 16,
                      backgroundColor: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        color.withValues(alpha: 0.7),
                      ),
                    ),
                    Positioned(
                      left: 8,
                      child: Text(
                        value.toStringAsFixed(0),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkConscious() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitle(
            title: "Ý thức làm việc",
            isExpand: isExpandedList[4],
            onTap: () {
              expandDetailSalary(4);
            },
          ),
          _buildWorkConsciousTable(),
        ],
      ),
    );
  }

  Widget _buildWorkConsciousTable() {
    return Visibility(
      visible: isExpandedList[4],
      maintainSize: false,
      maintainAnimation: false,
      child: Table(
        border: TableBorder(
          horizontalInside: BorderSide(color: Colors.black12),
        ),
        columnWidths: const {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(2),
          2: FlexColumnWidth(1.5),
        },
        children: [
          const TableRow(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Chỉ số",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Tổng số",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "TB cá nhân/Tháng",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          ...workList.map((item) {
            return TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(item.indicator),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.lightGreen.withValues(alpha: 0.1),
                  ),
                  child: Text(
                    item.total,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.lightGreen),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.fromLTRB(52, 12, 8, 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.lightGreen.withValues(alpha: 0.1),
                  ),
                  child: Text(
                    item.average,
                    textAlign: TextAlign.right,
                    style: const TextStyle(color: Colors.lightGreen),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildHealthy() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitle(
            title: "Sức khỏe",
            isExpand: isExpandedList[3],
            onTap: () {
              expandDetailSalary(3);
            },
          ),
          _buildHealthyTable(),
        ],
      ),
    );
  }

  Widget _buildHealthyTable() {
    return Visibility(
      visible: isExpandedList[3],
      maintainSize: false,
      maintainAnimation: false,
      child: Table(
        border: TableBorder(
          horizontalInside: BorderSide(color: Colors.black12),
        ),
        columnWidths: const {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(1),
          2: FlexColumnWidth(1),
        },
        children: [
          const TableRow(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Thông tin",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Chỉ số",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Unit",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          ...healthList.map((item) {
            return TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(item.title),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    item.value,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black54),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    item.unit,
                    textAlign: TextAlign.right,
                    style: const TextStyle(color: Colors.black54),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildDebt() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitle(
            title: "Công nợ",
            isExpand: isExpandedList[2],
            onTap: () {
              expandDetailSalary(2);
            },
          ),
          _buildTotalDebt(),
        ],
      ),
    );
  }

  Widget _buildTotalDebt() {
    return Visibility(
      visible: isExpandedList[2],
      maintainSize: false,
      maintainAnimation: false,
      child: Column(
        children: [
          _buildHeaderDebt(),
          const SizedBox(height: 20),
          _buildDebtItem(
            icon: Icons.attach_money,
            iconColor: Colors.red,
            title: "Công ty nợ",
            amount: "0 đ",
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80, right: 16),
            child: Divider(),
          ),
          _buildDebtItem(
            icon: Icons.attach_money,
            iconColor: Colors.blue,
            title: "Bạn nợ",
            amount: "0 đ",
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildDebtItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String amount,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor, size: 28),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
          Text(
            amount,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderDebt() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      decoration: BoxDecoration(
        color: Colors.pinkAccent.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Tổng công nợ",
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
              SizedBox(height: 6),
              Text(
                "0 đ",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Icon(Icons.bar_chart, size: 120, color: Colors.pink),
        ],
      ),
    );
  }

  Widget _buildProfileProcess() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitle(
            title: "Tiến trình tiếp nhận hồ sơ",
            isExpand: isExpandedList[1],
            onTap: () {
              expandDetailSalary(1);
            },
          ),
          _buildListProfile(),
        ],
      ),
    );
  }

  Widget _buildListProfile() {
    return Visibility(
      visible: isExpandedList[1],
      maintainSize: false,
      maintainAnimation: false,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        itemCount: documentList.length,
        itemBuilder: (context, index) {
          return _buildItemList(index);
        },
      ),
    );
  }

  Widget _buildItemList(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.check, color: Colors.black54, size: 24),
          SizedBox(width: 12),
          Text(
            documentList[index],
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
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
          HeaderTitle(
            title: "Quy trình làm việc",
            isExpand: isExpandedList[0],
            onTap: () {
              expandDetailSalary(0);
            },
          ),
          _buildListProcess(),
        ],
      ),
    );
  }

  Widget _buildListProcess() {
    return Visibility(
      visible: isExpandedList[0],
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
                      color: Colors.lightGreen[100],
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Text(
                      "Đang làm việc",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.lightGreen,
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
}
