
import 'package:flutter/material.dart';

class CustomTextField {

  Widget _buildTextField(BuildContext context, bool isNameKey, bool isVisibily) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Vui lòng điền vào trường này";
        }
        return null;
      },
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
          icon: isVisibily
              ? Icon(Icons.visibility_outlined)
              : Icon(Icons.visibility_off_outlined), onPressed: () {  },
        ),
      ),
    );
  }
}