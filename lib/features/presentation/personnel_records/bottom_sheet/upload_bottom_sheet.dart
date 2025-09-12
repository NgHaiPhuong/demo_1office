
import 'package:demo_1office/features/presentation/personnel_records/page/personnel_records_page.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/functional_item.dart';

void showUpLoadBottomSheet(BuildContext context) {

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          border: Border(
            top: BorderSide(color: Color(0xFFE0E0E0), width: 1),
          ),
        ),
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FunctionItem(
                icon: Icons.download_for_offline_outlined,
                text: 'Tải lên trực tiếp',
              ),
              SizedBox(height: 8),
              FunctionItem(
                icon: Icons.cloud_download_sharp,
                text: 'Chọn từ drive khác',
              ),
            ],
          ),
        ),
      );
    },
  );
}

