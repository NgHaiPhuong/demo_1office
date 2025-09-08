import 'package:demo_1office/features/presentation/log_in/bloc/log_in_state.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../forgot_pass/page/forgot_pass_page.dart';
import '../../home/page/home_page.dart';
import '../../../../core/utils/custom_text_field.dart';
import '../bloc/log_in_bloc.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final List<String> items = [
    "assets/flags/vn_flag.png",
    "assets/flags/uk_flag.png",
  ];

  final nameKey = GlobalKey<FormState>();
  final passKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogInCubit, LogInState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<LogInCubit>();

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            body: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildMenu(context),
                    _buildLogo(),
                    CustomTextField(),
                    _buildTextField(context, false),
                    _buildOptionLogin(),
                    _buildBtnConfirmLogIn(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBtnConfirmLogIn() {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextButton(
        onPressed: () {
          /*if (nameKey.currentState!.validate()) {
                            nameKey.currentState!.save();
                          }*/
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        },
        child: Text(
          "ĐĂNG NHẬP",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildOptionLogin(){
    return BlocBuilder<LogInCubit, LogInState>(
      builder: (context, state) {
        final cubit = context.read<LogInCubit>();

        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    materialTapTargetSize:
                    MaterialTapTargetSize.shrinkWrap,
                    value: state.isSaveInfo,
                    activeColor: Colors.blueAccent,
                    onChanged: (bool? value) {
                      cubit.isSaveInfo(value);
                    },
                  ),
                  Text(
                    "Giữ tôi luôn đăng nhập",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ForgotPassPage(),
                    ),
                  );
                },
                child: Text(
                  "Quên mật khẩu",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.only(top: 120, bottom: 30),
      child: Center(
        child: Image.asset(
          "assets/images/logo.jpg",
          width: 140,
        ),
      ),
    );
  }

  Widget _buildMenu(BuildContext context) {
    return BlocBuilder<LogInCubit, LogInState>(
      builder: (context, state) {
        final cubit = context.read<LogInCubit>();

        return Align(
          alignment: Alignment.topRight,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: DropdownButton2<String>(
              underline: const SizedBox(),
              value: state.urlFlag,
              hint: Image.asset(state.urlFlag, width: 30, fit: BoxFit.fitWidth),
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Image.asset(item, width: 30, fit: BoxFit.fitWidth),
                );
              }).toList(),
              onChanged: cubit.changeFlag,
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 5,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                offset: const Offset(0, -5),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField(BuildContext context, bool isNameKey) {
    return BlocBuilder<LogInCubit, LogInState>(
      builder: (context, state) {
        final cubit = context.read<LogInCubit>();

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: TextFormField(
            key: isNameKey ? nameKey : passKey,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Vui lòng điền vào trường này";
              }
              return null;
            },
            obscureText: isNameKey ? false : state.obscureText,
            decoration: InputDecoration(
              labelText: isNameKey ? "Tên đăng nhập*" : "Mật khẩu*",
              labelStyle: TextStyle(color: Colors.grey),
              prefixIcon: isNameKey
                  ? Icon(Icons.person_outline_sharp, color: Colors.grey)
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
              suffixIcon: isNameKey
                  ? SizedBox()
                  : IconButton(
                      onPressed: cubit.statusEye,
                      icon: state.obscureText
                          ? Icon(Icons.visibility_outlined)
                          : Icon(Icons.visibility_off_outlined),
                    ),
            ),
          ),
        );
      },
    );
  }
}
