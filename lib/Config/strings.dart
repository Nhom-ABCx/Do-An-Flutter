// ignore_for_file: non_constant_identifier_names, constant_identifier_names
//chua xu ly'
class StringConstant {
  //wellcome
  static const String titleWellcome = "titleWellcome";
  static const String subTitleWellcome = "subTitleWellcome";
  static const String Login = "Login";
  //intro_page
  static const String introTitle1 = "introTitle1";
  static const String introBody1 = "introBody1";
  static const String introTitle2 = "introTitle2";
  static const String introBody2 = "introBody2";
  static const String introTitle3 = "introTitle3";
  static const String introBody3 = "introBody3";
  static const String introTitle4 = "introTitle4";
  static const String introBody4 = "introBody4";
  static const String lastTitleIntro = "lastTitleIntro";
  static const String lastBodyIntro = "lastBodyIntro";
  //bottom_Appbar
  static const String Home = "Home";
  static const String Myorder = "Myorder";
  static const String Favorite = "Favorite";
  static const String Setting = "Setting";
  //setting_page
  static const String Language = 'Language';
  static const String English = 'English';
  static const String Vietnamese = 'Vietnamese';
  static const String Japanese = 'Japanese';
  static const String Notify = 'Notify';
  static const String UserManual = 'UserManual';
  static const String FrequentlyAskedQuestions = 'FrequentlyAskedQuestions';
  static const String Juridical = 'Juridical';
  static const String GeneralAssessment = 'GeneralAssessment';
  static const String DarkMode = 'DarkMode';
  static const String Logout = 'Logout';

  //
  static const String Skip = "Skip";
  static const String Done = "Done";
}

extension StringExtension on String {
  bool get isEmail => RegExp(r'\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*').hasMatch(this);
  bool get isHexColor => RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(this);
}
