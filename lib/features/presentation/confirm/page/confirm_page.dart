import 'package:flutter/material.dart';

import '../../verification/page/verification_page.dart';

class ConfirmPage extends StatelessWidget {
  const ConfirmPage({super.key, required this.info});

  final String info;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLogo(),
            _buildText(context),
            _buildChooseOption(context),
            _buildChangeAcc(context)
          ],
        ),
      ),
    );
  }

  Widget _buildChangeAcc(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context, true);
      },
      child: Center(
        child: Text(
          "Thay đổi tài khoản",
          style: TextStyle(fontSize: 14, color: Colors.indigoAccent),
        ),
      ),
    );
  }

  Widget _buildChooseOption(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 38),
      child: Row(
        children: [
          _buildApp(context, true),
          SizedBox(width: 16),
          _buildApp(context, false)
        ],
      ),
    );
  }

  Widget _buildApp(BuildContext context, bool isChooseZalo) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => VerificationPage(isZalo: isChooseZalo, info: info),
            ),
          );
        },
        child:  Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 75,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black12, width: 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                isChooseZalo ? "assets/images/zalo.png" : "assets/images/message.png",
                width: 35,
                fit: BoxFit.fitHeight,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Text(
                    isChooseZalo ? "Zalo" : "Tin nhắn SMS",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Chọn phương thức để gửi mã xác minh tới",
          style: TextStyle(color: Colors.black38, fontSize: 16),
        ),
        SizedBox(height: 12),
        Text(
          info,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 38),
      ],
    );
  }

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.only(top: 60, bottom: 38),
      child: Center(
        child: Image.asset("assets/images/logo.jpg", width: 140),
      ),
    );
  }

  PreferredSizeWidget? _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        "Phương thức xác minh",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

