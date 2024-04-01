import 'package:get/get.dart';

import 'outsourced_ong_details_controller.dart';

class OutsourcedOngDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OutsourcedOngDetailsController>(
      () => OutsourcedOngDetailsController(),
    );
  }
}
