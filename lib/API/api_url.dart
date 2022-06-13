// ignore_for_file: non_constant_identifier_names

class ApiUrl {
  //method get
  static String get_search(String type) => "/search/$type";
  static String get get_banner => "/banner";
  //method post
  static String post_aaa(String type) => "/aaa/$type";
  static String get post_login => "/login";
}
