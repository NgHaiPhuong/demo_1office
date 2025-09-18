
import 'package:demo_1office/features/presentation/personnel_records/widget/phone_bottomsheet.dart';
import 'package:flutter/material.dart';

import '../../../data/models/general_item.dart';

class GeneralInfo extends StatelessWidget {
  final List<GeneralItem> generalList;

  const GeneralInfo({super.key, required this.generalList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: generalList.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: _buildItemListInfo(context, index),
        );
      },
    );
  }

  Widget _buildItemListInfo(BuildContext context, int index) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: generalList[index].color.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            generalList[index].icon,
            color: generalList[index].color,
            size: 26,
          ),
        ),
        const SizedBox(width: 18),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              generalList[index].title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 5),
            if (generalList[index].title.contains("Điện thoại")) ...[
              _buildPhone(context, index)
            ]
            else ...[
              Text(
                generalList[index].information,
                style: const TextStyle(fontSize: 15, color: Colors.black),
              ),
            ],
          ],
        ),
      ],
    );
  }

  Widget _buildPhone(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        showPhoneBottomSheet(context, generalList[index].information);
      },
      child: Container(
        padding: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.lightGreen.withValues(alpha: 0.25),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.lightGreen.shade600,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.phone,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              generalList[index].information,
              style: TextStyle(
                color: Colors.lightGreen,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
