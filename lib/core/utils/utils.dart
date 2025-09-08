
class Utils{

  bool isValidVNMobile(String input) {
    final s = input.trim().replaceAll(' ', '');
    final re = RegExp(r'^(?:\+84|0)(?:3|5|7|8|9)\d{8}$');
    return re.hasMatch(s);
  }
}