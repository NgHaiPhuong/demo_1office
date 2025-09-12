import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../features/presentation/payroll/widget/notify_dialog.dart';

class HistorySalaryWidget extends StatelessWidget {
  final bool isExpanded;
  OverlayEntry? overlayEntry;
  final GlobalKey? iconKey;
  final VoidCallback? onTap;

  HistorySalaryWidget({
    super.key,
    this.isExpanded = true,
    this.overlayEntry,
    this.iconKey,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSalaryCard(context),
        _buildHideOrShow(),
      ],
    );
  }

  Widget _buildSalaryCard(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    "04/08/2025",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    key: iconKey,
                    onTap: () => showOverlay(context),
                    child: const Icon(Icons.info_outline, color: Colors.orange, size: 20),
                  ),
                ],
              ),
              Icon(
                isExpanded ? Icons.expand_less : Icons.expand_more,
                color: Colors.black87,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHideOrShow() {
    return AnimatedCrossFade(
      firstChild: Container(),
      secondChild: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: Column(
          children: [
            _buildSalaryRow("Lương cơ bản gross", "100,000,000"),
            const Divider(),
            _buildSalaryRow("Onsite", "1,000,000"),
          ],
        ),
      ),
      crossFadeState: isExpanded
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 100),
    );
  }

  Widget _buildSalaryRow(String title, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 15, color: Colors.black87)),
          Container(
            width: 150,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.green.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showOverlay(BuildContext context) {
    if (overlayEntry != null) {
      _removeOverlay();
      return;
    }

    final renderBox = iconKey?.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);

    overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          GestureDetector(
            onTap: _removeOverlay,
            child: Container(color: Colors.black.withValues(alpha: 0.5)),
          ),
          Positioned(
            left: 12,
            top: position.dy - 60,
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                    )
                  ],
                ),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                    children: [
                      const TextSpan(text: "Lịch sử tự động sinh ra từ hợp đồng. "),
                      TextSpan(
                        text: "Chi tiết",
                        style: TextStyle(color: Colors.green[700], fontWeight: FontWeight.w600),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            showCustomDialog(context);
                            _removeOverlay();
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(overlayEntry!);
  }

  void _removeOverlay() {
    overlayEntry?.remove();
  }
}
