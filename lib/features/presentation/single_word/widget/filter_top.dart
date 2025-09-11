import 'package:flutter/material.dart';
import '../../../../core/utils/functional_item.dart';

void showFilterTopBottomSheet(BuildContext context) {
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
            children: [
              Row(
                children: [
                  Icon(Icons.sort_by_alpha_sharp,color: Colors.grey,),
                  SizedBox(width: 10),
                  Text('Sắp xếp danh sách ', style: TextStyle(fontSize: 18)),
                  Spacer(),
                  Icon(Icons.chevron_right,color: Colors.grey, size: 30),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

