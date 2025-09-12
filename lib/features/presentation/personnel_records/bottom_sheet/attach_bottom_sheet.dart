import 'package:demo_1office/core/utils/no_data.dart';
import 'package:flutter/material.dart';

void showAttachBottomSheet(BuildContext context) {

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
          border: Border(top: BorderSide(color: Color(0xFFE0E0E0), width: 1)),
        ),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Đính kèm",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                  border: Border(
                    top: BorderSide(color: Colors.grey.shade200, width: 2),
                  ),
                ),
                child: NoData(message: "Bạn không có file đính kèm nào"),
              ),
              SizedBox(height: 300)
            ],
          ),
        ),
      );
    },
  );
}
