import 'package:intl/intl.dart';

class Helper {
  static String formatNumber(num number) => NumberFormat("#,###.#######", "en_US").format(number);

  static String formatDateTime(String dateString) {
    if (dateString.isEmpty) {
      return "";
    }
    var inputDate = DateTime.parse(dateString);
    String output = DateFormat('dd-MM-yyyy').format(inputDate);
    return output;
  }

  static String cutFirstCharName(String name) {
    if (name.trim().isNotEmpty) {
      final List<String> nameArr = name.split("");
      final String nameCut = nameArr.first.toUpperCase();
      return nameCut;
    }
    return "";
  }

  //limitShowList
  static void limitShowList(List list, [int limit = 5]) => (list.length > limit) ? list.removeRange(limit, list.length) : null;
}
