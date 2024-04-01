import 'package:get/get.dart';

import '../../repository/repository.dart';
import 'register_ong_controller.dart';

class RegisterOngBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<IOutsourcedOngRepository>(() => OutsourcedOngRepository())
      ..lazyPut(
        () => RegisterOngController(
          Get.find(),
        ),
      );
  }
}
