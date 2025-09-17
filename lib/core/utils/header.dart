import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  final String title;
  final bool isExpand;
  final bool isMoreIcon;
  final IconData? icon;
  final VoidCallback? onTap;
  final VoidCallback? onTapMoreIcon;

  const HeaderTitle({
    super.key,
    required this.title,
    required this.isExpand,
    this.isMoreIcon = false,
    this.icon,
    this.onTap,
    this.onTapMoreIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: onTapMoreIcon,
                child: Icon(isMoreIcon ? icon : null, color: Colors.grey),
              ),
              SizedBox(width: 12),
              InkWell(
                onTap: onTap,
                child: Icon(
                  isExpand
                      ? Icons.remove
                      : Icons.check_box_outline_blank_outlined,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
