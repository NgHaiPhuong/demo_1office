import 'package:flutter/material.dart';

class FunctionItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color backgroundColor;
  final Color iconColor;
  final Color textColor;
  final TextStyle? textStyle;
  final VoidCallback? onTap;
  final bool showBadge;
  final bool showLanguage;

  const FunctionItem({
    super.key,
    required this.icon,
    required this.text,
    this.backgroundColor = Colors.white,
    this.iconColor = Colors.grey,
    this.textColor = Colors.black,
    this.textStyle,
    this.onTap,
    this.showBadge = false,
    this.showLanguage = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: backgroundColor,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: iconColor, size: 26),
            const SizedBox(width: 8),
            Text(
              text,
              style: textStyle ?? TextStyle(fontSize: 18, color: textColor),
            ),
            if (showBadge) ...[
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: const Text(
                  'New',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ],
            if (showLanguage) ...[
              Expanded(child: SizedBox()),
              const Text(
                'VN',
                style: TextStyle(fontSize: 18),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
