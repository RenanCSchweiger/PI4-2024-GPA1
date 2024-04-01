import 'package:get/get.dart';

import '../../outsourced_ong.dart';

class OngFormBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<IOutsourcedOngRepository>(() => OutsourcedOngRepository())
      ..lazyPut(
        () => OngFormController(
          Get.find(),
        ),
      );
  }
}
