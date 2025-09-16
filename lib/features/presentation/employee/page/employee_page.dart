
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({super.key});

  @override
  State<EmployeePage> createState() => _EmployeePage();
}

class _EmployeePage extends State<EmployeePage> {

  final GlobalKey iconKey = GlobalKey();
  OverlayEntry? overlayEntry;

  void showOverlay(BuildContext context) {
    if (overlayEntry != null) {
      _removeOverlay();
      return;
    }

    final renderBox = iconKey.currentContext!.findRenderObject() as RenderBox;
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
            top: position.dy - 150,
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: 360,
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Để tìm hiểu nhiều từ khóa bạn có thể dùng dấu, để ngăn cách các từ khóa",
                        style: TextStyle(color: Colors.grey, fontSize: 16)),
                    Text("Ví dụ như: kinh doanh, trưởng phòng sẽ hiện ra lựa chọn vị trí trưởng phòng của phòng kinh doanh",
                        style: TextStyle(color: Colors.grey, fontSize: 16)),
                  ],
                )
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
    overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [_buildHeader(), _buildSearch(), _buildListAndBtn()],
        ),
      ),
    );
  }

  Widget _buildListAndBtn() {
    return Expanded(
      child: Stack(
        children: [
          _buildListApp(),
          Align(alignment: Alignment.bottomCenter, child: _buildBtnUpdate()),
        ],
      ),
    );
  }

  Widget _buildListApp() {
    return Container(
      padding: const EdgeInsets.only(bottom: 80),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Danh sách người dùng", style: TextStyle(color: Colors.grey, fontSize: 16)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon((Icons.account_tree_outlined), color: Colors.grey),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                width: 1,
                height: 24,
                color: Colors.grey,
              ),
              const Icon((Icons.save_outlined), color: Colors.grey),
              SizedBox(width: 8),
              GestureDetector(
                key: iconKey,
                onTap: () => showOverlay(context),
                child: const Icon((Icons.help_outline), color: Colors.orangeAccent, size: 18),
              ),
            ],
          )
        ],
      )
    );
  }

  Widget _buildBtnUpdate() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Text(
        "HOÀN TẤT",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }

  Widget _buildSearch() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        decoration: InputDecoration(
          hint: Text(
            "Tìm kiếm...",
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: Colors.lightGreen,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Text(
        "Nhân sự",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}