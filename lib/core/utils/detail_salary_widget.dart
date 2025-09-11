
import 'package:flutter/material.dart';

class DetailSalaryWidget extends StatelessWidget {
  final List<int> salaryByMonth;

  const DetailSalaryWidget({
    super.key,
    required this.salaryByMonth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_buildSalaryTotal(), _buildListSalary()],
    );
  }

  Widget _buildListSalary() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: salaryByMonth.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tháng ${index + 1}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  Container(
                    width: 43,
                    height: 43,
                    decoration: BoxDecoration(
                      color: Colors.green.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        ((index + 1) == DateTime.now().month)
                            ? "-"
                            : "${salaryByMonth[index]}",
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
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: double.infinity,
                height: 1,
                color: Colors.grey.shade200,
              ),
            ],
          ),
        );
      },
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
