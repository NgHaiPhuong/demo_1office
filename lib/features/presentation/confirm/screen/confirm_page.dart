import 'package:demo_1office/features/presentation/verification/screen/verification_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/confirm_bloc.dart';
import '../bloc/confirm_state.dart';

class ConfirmPage extends StatefulWidget {
  const ConfirmPage({super.key, required this.info});

  final String info;

  @override
  State<ConfirmPage> createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConfirmCubit, ConfirmState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<ConfirmCubit>();

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "Phương thức xác minh",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60, bottom: 30),
                  child: Center(
                    child: Image.asset("assets/images/logo.jpg", width: 140),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Chọn phương thức để gửi mã xác minh tới",
                  style: TextStyle(color: Colors.black38, fontSize: 16),
                ),
                SizedBox(height: 12),
                Text(
                  widget.info,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 38),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => VerificationPage(isZalo: true, info: widget.info),
                            ),
                          );
                        },
                        child: Container(
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
                                "assets/images/zalo.png",
                                width: 35,
                                fit: BoxFit.fitHeight,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: Text(
                                  "Zalo",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => VerificationPage(isZalo: false, info: widget.info),
                            ),
                          );
                        },
                        child: Container(
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
                                "assets/images/message.png",
                                width: 35,
                                fit: BoxFit.fitHeight,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: Text(
                                    "Tin nhắn SMS",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 38),
                InkWell(
                  onTap: () {
                    Navigator.pop(context, true);
                  },
                  child: Center(
                    child: Text(
                      "Thay đổi tài khoản",
                      style: TextStyle(fontSize: 14, color: Colors.indigoAccent),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
