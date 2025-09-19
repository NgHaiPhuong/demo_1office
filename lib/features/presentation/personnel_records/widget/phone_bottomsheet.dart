import 'package:demo_1office/core/utils/functional_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

void showPhoneBottomSheet(BuildContext context, String phoneNumber) {

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
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FunctionItem(
                text: "Sao chép",
                icon: Icons.copy,
                onTap: () {
                  Navigator.pop(context);
                  Clipboard.setData(ClipboardData(text: phoneNumber));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                        "Đã sao chép số điện thoại",
                        style: TextStyle(color: Colors.black),
                      ),
                      backgroundColor: Colors.white,
                      behavior: SnackBarBehavior.floating,
                      margin: const EdgeInsets.all(12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
              ),
              SizedBox(height: 5),
              FunctionItem(text: "Gọi", icon: Icons.phone_forwarded_rounded, onTap: () {
                Navigator.pop(context);
                _makePhoneCall(phoneNumber);
              }),
            ],
          ),
        ),
      );
    },
  );
}

Future<void> _makePhoneCall(String number) async {
  final Uri uri = Uri(scheme: 'tel', path: number);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    debugPrint("Không thể gọi số $number");
  }
}