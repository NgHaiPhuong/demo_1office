
import 'package:intl/intl.dart';

class Utils{

  bool isValidVNMobile(String input) {
    final s = input.trim().replaceAll(' ', '');
    final re = RegExp(r'^(?:\+84|0)(?:3|5|7|8|9)\d{8}$');
    return re.hasMatch(s);
  }

  bool validateEmail(String email) {
    final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    );
    return emailRegex.hasMatch(email);
  }

  String formatMoneyWithVND(double value) {
    final formatter = NumberFormat("#,###", "vi_VN");
    return "${formatter.format(value)} ₫";
  }

  String formatMoney(double value) {
    final formatter = NumberFormat("#,###", "vi_VN");
    return formatter.format(value);
  }

  double convertToMillion(double value) {
    return (value / 1000000);
  }
}