
import 'package:demo_1office/core/utils/utils.dart';
import 'package:demo_1office/features/presentation/payroll/tab/salary_bottomsheet.dart';
import 'package:flutter/material.dart';

import '../../features/data/models/salary_data.dart';

class DetailSalaryWidget extends StatelessWidget {
  final List<SalaryData> dataSalary;

  const DetailSalaryWidget({
    super.key,
    required this.dataSalary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_buildSalaryTotal(), _buildListSalary(context)],
      ),
    );
  }

  Widget _buildListSalary(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: dataSalary.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return _buildItemSalary(context, index);
      },
    );
  }

  Widget _buildItemSalary(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        showSalaryBottomSheet(context, dataSalary[index]);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dataSalary[index].month,
                  style: const TextStyle(fontSize: 16),
                ),
                Container(
                  height: 43,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      ((index + 1) == DateTime.now().month) ? "-" : Utils().formatMoney(dataSalary[index].salary),
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(color: Colors.grey.shade200)
          ],
        ),
      ),
    );
  }

  Widget _buildSalaryTotal() {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tổng lương thực nhận",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              SizedBox(height: 5),
              Text(
                "0",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Image.asset(
            "assets/images/salary.png",
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
