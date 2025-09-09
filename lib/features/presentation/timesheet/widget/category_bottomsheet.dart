import 'package:flutter/material.dart';
import '../../../../core/utils/functional_item.dart';

void showCategoryBottomSheet(BuildContext context) {
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
                icon: Icons.paid_outlined,
                text: 'Bảng lương',
              ),
              FunctionItem(
                icon: Icons.person_pin_outlined,
                text: 'Hồ sơ nhân sự',
              ),
              FunctionItem(
                icon: Icons.request_page_outlined,
                text: 'Vay theo lương',
              ),
            ],
          ),
        ),
      );
    },
  );
}

