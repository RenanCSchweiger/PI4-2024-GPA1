import 'package:get/get.dart';

import '../../../../lib.dart';

class RegisterOutsourcedBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<IOutsourcedOngRepository>(() => OutsourcedOngRepository())
      ..lazyPut(
        () => RegisterOutsourcedController(
          Get.find(),
        ),
      );
  }
}
