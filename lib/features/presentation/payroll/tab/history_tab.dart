import 'package:flutter/material.dart';

import '../../../../core/utils/history_widget.dart';

class HistoryTab extends StatefulWidget {
  const HistoryTab({super.key});

  @override
  State<HistoryTab> createState() => _HistoryTab();
}

class _HistoryTab extends State<HistoryTab> {
  bool isExpanded = true;
  OverlayEntry? _overlayEntry;
  final GlobalKey _iconKey = GlobalKey();

  void isHideAndShow() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return HistorySalaryWidget(
      isExpanded: isExpanded,
      overlayEntry: _overlayEntry,
      iconKey: _iconKey,
      onTap: () {
        isHideAndShow();
      },
    );
  }
}
