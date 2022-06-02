// ignore_for_file: avoid_print
//https://stackoverflow.com/questions/54018071/how-to-call-print-with-colorful-text-to-android-studio-console-in-flutter
class Printt {
  static void black(String text) => print('\x1B[30m$text\x1B[0m');
  static void red(String text) => print('\x1B[31m$text\x1B[0m');
  static void green(String text) => print('\x1B[32m$text\x1B[0m');
  static void yellow(String text) => print('\x1B[33m$text\x1B[0m');
  static void blue(String text) => print('\x1B[34m$text\x1B[0m');
  static void magenta(String text) => print('\x1B[35m$text\x1B[0m');
  static void cyan(String text) => print('\x1B[36m$text\x1B[0m');
  static void white(String text) => print('\x1B[37m$text\x1B[0m');
  static void reset(String text) => print('\x1B[38m$text\x1B[0m');
}
