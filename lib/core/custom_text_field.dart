import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final bool isNameKey;
  final bool isObscureText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    this.isNameKey = true,
    this.isObscureText = false,
    this.controller,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      obscureText: isObscureText,
      validator: validator ?? (value) {
        if (value == null || value.trim().isEmpty) {
          return "Vui lòng điền vào trường này";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: isNameKey ? "Tên đăng nhập*" : "Mật khẩu*",
        labelStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Icon(
          isNameKey ? Icons.person_outline_sharp : Icons.lock_outline_rounded,
          color: Colors.grey,
        ),
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 21),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey, width: 2),
        ),
      ),
    );
  }
}