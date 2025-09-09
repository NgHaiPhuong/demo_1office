import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../widget/notify_dialog.dart';

class HistoryTab extends StatefulWidget {
  const HistoryTab({super.key});

  @override
  State<HistoryTab> createState() => _HistoryTab();
}

class _HistoryTab extends State<HistoryTab> {

  bool isExpanded = true;
  OverlayEntry? _overlayEntry;
  final GlobalKey _iconKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSalaryCard(),
        _buildHideOrShow(),
      ],
    );
  }

  void _showOverlay(BuildContext context) {
    if (_overlayEntry != null) {
      _removeOverlay();
      return;
    }

    final renderBox = _iconKey.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // nền mờ
          GestureDetector(
            onTap: _removeOverlay,
            child: Container(color: Colors.black.withOpacity(0.5)),
          ),

          // tooltip nổi trên icon hỏi chấm
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

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  Widget _buildSalaryCard() {
    return InkWell(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
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
                    key: _iconKey,
                    onTap: () => _showOverlay(context),
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
}