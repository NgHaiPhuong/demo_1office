import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  final nameKey = GlobalKey<FormState>();
  final passKey = GlobalKey<FormState>();

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
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text("Lấy lại mật khẩu",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
            ),
            body: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60, bottom: 30),
                      child: Center(
                        child: Image.asset(
                          "assets/images/logo.jpg",
                          width: 140,
                        ),
                      ),
                    ),
                    _buildTextField(context, true),
                    SizedBox(height: 22,),
                    _buildTextField(context, false),
                    SizedBox(height: 12,),
                    Container(
                      padding: EdgeInsets.all(12),
                      color: Colors.grey.shade200,
                      child: Text(
                        "a7n", // Tạm thời fix cứng, có thể random sau
                        style: TextStyle(
                          fontSize: 36,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3,
                        ),
                      ),
                    ),
                    SizedBox(height: 12,),
                    Text("Click vào đây để thay đổi mã bảo mật khác"),
                    SizedBox(height: 22,),
                    Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextButton(
                          onPressed: () {

                          }, child: Text("XÁC NHẬN", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                    ),
                    SizedBox(height: 16,),
                    InkWell(onTap: () {Navigator.pop(context);}, child: Center(child: Text("Quay lại trang đăng nhập", style: TextStyle(color: Colors.indigoAccent),))),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField(BuildContext context, bool isNameKey) {
    return BlocBuilder<ForgotPassCubit, ForgotPassState>(
      builder: (context, state) {
        final cubit = context.read<ForgotPassCubit>();

        return TextFormField(
          key: isNameKey ? nameKey : passKey,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return "Vui lòng điền vào trường này";
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: isNameKey ? "Nhập Email/Số điện thoại*" : "Mã bảo mật*",
            labelStyle: TextStyle(fontSize: 15, color: Colors.grey),
            prefixIcon: isNameKey
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
        );
      },
    );
  }
}
