import 'package:do_an_flutter/Route/pages.dart';

class InforPage {
  //code Page
  static const String viewMoreSale = "viewMoreSale";
  static const String viewMoreRecent = "viewMoreRecent";

  static Map<String, dynamic> filterPage(String codePage, [dynamic arguments]) {
    Map<String, dynamic> data = {};

    switch (codePage) {
      case viewMoreSale:
        data['name'] = "Sales";
        data['code'] = viewMoreSale;
        data['screen'] = Routes.ViewMore;
        data['itemScreen'] = null;
        data['arguments'] = arguments;
        break;
      case viewMoreRecent:
        data['name'] = "Recent";
        data['code'] = viewMoreRecent;
        data['screen'] = Routes.ViewMore;
        data['itemScreen'] = null;
        data['arguments'] = arguments;
        break;
    }

    return data;
  }
}
