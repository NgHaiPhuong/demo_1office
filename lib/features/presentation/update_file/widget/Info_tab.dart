import 'package:flutter/material.dart';

class InfoTab extends StatefulWidget {
  const InfoTab({super.key});

  @override
  State<InfoTab> createState() => _InfoTab();
}

class _InfoTab extends State<InfoTab> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildGeneralInfo(),
              SizedBox(height: 18),
              _buildFamilyInfo(),
              SizedBox(height: 18),

              SizedBox(height: 55),
            ],
          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "CẬP NHẬT",
                  style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildFamilyInfo() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader("Thông tin chung"),
          const SizedBox(height: 16),
          _buildTextField(label: "Email", value: "nghaiphuong2003@gmail.com"),
          _buildTextField(label: "Điện thoại", value: "0826561203"),
          _buildTextField(label: "Nguyên quán", value: '', icon: Icons.search),
          _buildTextField(
            label: "[Thường trú] Xã phường, Quận huyện, Tỉnh...",
            value: "Thành phố Hà Nội, Việt Nam",
            icon: Icons.clear_rounded,
          ),
          _buildTextField(
            label: "[Thường trú] Số nhà, đường",
            value: "Xã Phú Cường (cũ), Huyện Sóc Sơn, Thành phố Hà Nội",
          ),
          _buildTextField(
            label: "[Chỗ ở hiện nay] Số nhà, đường",
            value: "Phú Diễn, Phúc Diễn, Bắc Từ Liêm, Hà Nội",
          ),
          _buildTextField(
            label: "[Chỗ ở hiện nay] Xã phường, Quận huyện, Tỉnh...",
            value: "Thành phố Hà Nội, Việt Nam",
            icon: Icons.clear_rounded,
          ),
        ],
      ),
    );
  }

  Widget _buildGeneralInfo() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader("Thông tin chung"),
          const SizedBox(height: 16),
          _buildTextField(label: "Email", value: "nghaiphuong2003@gmail.com"),
          _buildTextField(label: "Điện thoại", value: "0826561203"),
          _buildTextField(label: "Nguyên quán", value: '', icon: Icons.search),
          _buildTextField(
            label: "[Thường trú] Xã phường, Quận huyện, Tỉnh...",
            value: "Thành phố Hà Nội, Việt Nam",
            icon: Icons.clear_rounded,
          ),
          _buildTextField(
            label: "[Thường trú] Số nhà, đường",
            value: "Xã Phú Cường (cũ), Huyện Sóc Sơn, Thành phố Hà Nội",
          ),
          _buildTextField(
            label: "[Chỗ ở hiện nay] Số nhà, đường",
            value: "Phú Diễn, Phúc Diễn, Bắc Từ Liêm, Hà Nội",
          ),
          _buildTextField(
            label: "[Chỗ ở hiện nay] Xã phường, Quận huyện, Tỉnh...",
            value: "Thành phố Hà Nội, Việt Nam",
            icon: Icons.clear_rounded,
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String value,
    IconData? icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: TextField(
        controller: TextEditingController(text: value),
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          suffixIcon: Icon(icon, size: 24, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildHeader(String title) {
    return Row(
      children: [
        const Icon(Icons.keyboard_arrow_down, color: Colors.green),
        const SizedBox(width: 6),
        Text(
          title,
          style: const TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
