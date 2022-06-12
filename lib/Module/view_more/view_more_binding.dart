import 'package:do_an_flutter/Module/view_more/view_more_controller.dart';
import 'package:get/get.dart';

class ViewMoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ViewMoreController());
  }
}
