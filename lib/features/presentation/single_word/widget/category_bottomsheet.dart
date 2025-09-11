import 'package:flutter/material.dart';
import '../../../../core/utils/functional_item.dart';

void showCategorySingleWordBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        width: double.infinity,
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
                icon: Icons.data_thresholding_outlined,
                text: 'Dashboard',
              ),
              FunctionItem(
                icon: Icons.sticky_note_2_outlined,
                text: 'Đơn từ hành chính',
                textColor: Colors.lightGreen,
              ),
              FunctionItem(
                icon: Icons.paid_outlined,
                text: 'Ứng lương 1Office',
              ),
            ],
          ),
        ),
      );
    },
  );
}

