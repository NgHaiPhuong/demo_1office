
import 'package:flutter/material.dart';

class SalaryTab extends StatefulWidget {
  const SalaryTab({super.key});

  @override
  State<SalaryTab> createState() => _SalaryTab();
}

class _SalaryTab extends State<SalaryTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 18),
        ],
      ),
    );
  }
}