import 'dart:math';

import 'package:demo_1office/features/presentation/confirm/page/confirm_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/utils.dart';
import '../bloc/forgot_pass_bloc.dart';
import '../bloc/forgot_pass_state.dart';

class ForgotPassPage extends StatefulWidget {
  const ForgotPassPage({super.key});

  @override
  State<ForgotPassPage> createState() => _ForgotPassPageState();
}

class _ForgotPassPageState extends State<ForgotPassPage> {
  final List<String> items = [
    "assets/flags/vn_flag.png",
    "assets/flags/uk_flag.png",
  ];

  late String captcha;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    captcha = _generateCaptcha();
  }

  void changeCaptcha() {
    setState(() {
      captcha = _generateCaptcha();
    });
  }

  // Hàm tạo mã captcha ngẫu nhiên
  String _generateCaptcha() {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    return List.generate(4, (index) => chars[random.nextInt(chars.length)]).join();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPassCubit, ForgotPassState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<ForgotPassCubit>();

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            appBar: _buildAppBar(),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLogo(),
                    _buildTextField(context, true),
                    _buildTextField(context, false),
                    _buildCaptcha(),
                    _buildTextChangeCaptcha(),
                    _buildBtnConfirm(),
                    _buildBackToLogIn()
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBackToLogIn() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Center(
        child: Text(
          "Quay lại trang đăng nhập",
          style: TextStyle(color: Colors.indigoAccent),
        ),
      ),
    );
  }

  Widget _buildBtnConfirm() {
    return Container(
      height: 55,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 22),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextButton(
          onPressed: () {
            if((Utils().isValidVNMobile(emailController.text) || Utils().validateEmail(emailController.text)) && (captcha == codeController.text)) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ConfirmPage(info: emailController.text),
                ),
              ).then((value) {
                if(value == true) {
                  emailController.text = "";
                  codeController.text = "";
                  changeCaptcha();
                }
              });
            } else {
              changeCaptcha();
              codeController.text = "";
            }
          }, child: Text("XÁC NHẬN", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
    );
  }

  Widget _buildTextChangeCaptcha() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: RichText(
        text: TextSpan(
          text: "Click vào ",
          style: TextStyle(color: Colors.black87, fontSize: 16),
          children: [
            TextSpan(
              text: "đây",
              style: TextStyle(
                color: Colors.black87,
                decoration: TextDecoration.underline, // gạch chân chữ đây
              ),
              recognizer: TapGestureRecognizer()..onTap = changeCaptcha,
            ),
            const TextSpan(
              text: " để thay đổi mã bảo mật khác",
              style: TextStyle(color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCaptcha() {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      margin: const EdgeInsets.only(bottom: 22),
      color: Colors.grey.shade200,
      child: Text(
        captcha,
        style: TextStyle(
          fontSize: 36,
          color: Colors.red,
          fontWeight: FontWeight.bold,
          letterSpacing: 3,
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return  Padding(
      padding: const EdgeInsets.only(top: 60, bottom: 30),
      child: Center(
        child: Image.asset(
          "assets/images/logo.jpg",
          width: 140,
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context, bool isEmailKey) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: isEmailKey ? emailController : codeController,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return "Vui lòng điền vào trường này";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: isEmailKey ? "Nhập Email/Số điện thoại*" : "Mã bảo mật*",
          labelStyle: TextStyle(fontSize: 15, color: Colors.grey),
          prefixIcon: isEmailKey
              ? Icon(Icons.email_outlined, color: Colors.grey)
              : Icon(Icons.lock_outline_rounded, color: Colors.grey),
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 21),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.blueAccent, width: 2),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget? _buildAppBar() {
    return AppBar(
        backgroundColor: Colors.white,
        title: Text("Lấy lại mật khẩu",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
    );
  }
}
