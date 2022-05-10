// ignore_for_file: non_constant_identifier_names, constant_identifier_names

class StringConstant {
  static const String Login = 'Login';
  //bottom Appbar
  static String Home = 'Home';
  static String Myorder = 'Myorder';
  static String Favorite = 'Favorite';
  static String Setting = 'Setting';
}

extension StringExtension on String {
  bool get isEmail => RegExp(r'\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*').hasMatch(this);
  bool get isHexColor => RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(this);
}
