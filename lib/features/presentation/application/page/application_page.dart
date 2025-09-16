import 'package:demo_1office/core/utils/data.dart';
import 'package:flutter/material.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPage();
}

class _ApplicationPage extends State<ApplicationPage> {
  final applicationList = LoadData().applicationList;

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

  Widget _buildListApp() {
    return Container(
      padding: const EdgeInsets.only(bottom: 80),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: applicationList.length,
        itemBuilder: (context, index) {
          return _buildItemList(index);
        },
      ),
    );
  }

  Widget _buildItemList(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 1),
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            applicationList[index].name,
            style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 8),
          Text(
            applicationList[index].des,
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
          SizedBox(height: 8),
        ],
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
        "Ứng dụng",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
