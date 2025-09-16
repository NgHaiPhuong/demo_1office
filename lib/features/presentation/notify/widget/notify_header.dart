import 'package:demo_1office/features/presentation/notify/page/notifty_page.dart';
import 'package:demo_1office/features/presentation/notify/widget/search_enhance_bottomsheet.dart';
import 'package:demo_1office/features/presentation/notify/widget/fiilter_bottomsheet.dart';
import 'package:flutter/material.dart';

import '../../home/page/home_page.dart';
import '../../menu/page/menu_page.dart';

class NotifyHeader extends StatelessWidget {
  final String title;
  final bool showBackButton;

  const NotifyHeader({
    super.key,
    required this.title,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          showBackButton
              ? InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.arrow_back),
                )
              : InkWell(
                  onTap: () {
                    Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => MenuPage()));
                  },
                  child: const Icon(Icons.grid_view_outlined, size: 30),
                ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              maxLines: 1,
              overflow: TextOverflow.visible,
            ),
          ),
          const SizedBox(width: 12),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                  onTap:() {
                    showSearchEnhanceBottomSheet(context);
                  }, child: const Icon(Icons.tune_outlined, size: 30)
              ),
              const SizedBox(width: 12),
              InkWell(
                onTap: () {
                  showFilterBottomSheet(context);
                }, child: Icon(Icons.sort, size: 30)),
              const SizedBox(width: 12),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Icon(Icons.home_outlined, size: 30),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
