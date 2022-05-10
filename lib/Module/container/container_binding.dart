import 'package:get/get.dart';

import 'container_controller.dart';

class ContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContainerController());
  }
}