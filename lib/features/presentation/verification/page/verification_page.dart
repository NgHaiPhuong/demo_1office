import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../log_in/page/log_in_page.dart';
import '../bloc/verification_bloc.dart';
import '../bloc/verification_state.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key, required this.isZalo, required this.info});

  final bool isZalo;
  final String info;

  @override
  State<VerificationPage> createState() => VerificationPageState();
}

class VerificationPageState extends State<VerificationPage> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerificationCubit, VerificationState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<VerificationCubit>();

        return Scaffold(
          appBar: _buildAppBar(),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildText(),
                _buildInformation(),
                _buildPinCode(),
                Text(
                  "Không nhận được mã?",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                SizedBox(height: 5),
                _buildTextConfirm(),
                _buildBtnConfirm(),
                _buildBackToLogIn(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBackToLogIn(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LogInPage()),
                (Route<dynamic> route) => false,
          );
        },
        child: Text(
          "Quay lại trang đăng nhập",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget _buildBtnConfirm(){
    return Container(
      height: 55,
      margin: const EdgeInsets.only(bottom: 12),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {

        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
        ),
        child: Text(
          "XÁC NHẬN",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildTextConfirm() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: RichText(
        text: TextSpan(
          text: "Gửi lại ",
          style: TextStyle(color: Colors.black38, fontSize: 16),
          children: [
            TextSpan(
              text: "(1:59)",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: " hoặc ",
              style: TextStyle(color: Colors.black54),
            ),
            TextSpan(
              text: "Đổi phương thức xác minh",
              style: TextStyle(color: Colors.indigoAccent),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pop(context);
                },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPinCode() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: PinCodeTextField(
        appContext: context,
        length: 6,
        // controller: otpController,
        animationType: AnimationType.fade,
        // errorAnimationController: errorController,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 48,
          fieldWidth: 48,
          activeFillColor: Colors.white,
          inactiveColor: Colors.grey.shade300,
          selectedColor: Colors.blue,
          selectedFillColor: Colors.white,
          activeColor: Colors.blue,
          inactiveFillColor: Colors.white,
        ),
        animationDuration: const Duration(milliseconds: 200),
        enableActiveFill: true,
        keyboardType: TextInputType.number,
        onCompleted: (v) {},
        onChanged: (value) {},
      ),
    );
  }

  Widget _buildInformation() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            widget.isZalo
                ? "assets/images/zalo.png"
                : "assets/images/message.png",
            width: 35,
            fit: BoxFit.fitHeight,
          ),
          SizedBox(width: 16),
          Text(
            widget.info,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildText() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: RichText(
        text: TextSpan(
          text: "Mã xác minh đã được gửi đến ",
          style: TextStyle(color: Colors.black54, fontSize: 16),
          children: [
            TextSpan(
              text: widget.isZalo ? "ZALO" : "SMS",
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget? _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        "Nhập mã xác minh",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
