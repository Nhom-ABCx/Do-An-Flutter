import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.putAsync<Service>(() => Service().init(), permanent: true);
  }
}

class Service extends GetxService {
  static final formatNumber = NumberFormat.simpleCurrency(); //("#,##0", "en_US");
  static const String defaultBaseUrl = "http://10.0.2.2:8000";
  late String baseUrl;
  late final SharedPreferences sharedPreferences;

  Future<Service> init() async {
    baseUrl = defaultBaseUrl + "/api";
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}
