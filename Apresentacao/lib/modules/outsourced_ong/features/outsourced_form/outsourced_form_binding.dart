import 'package:eco_clico_app/lib.dart';
import 'package:get/get.dart';

class OutsourcedFormBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<IOutsourcedOngRepository>(() => OutsourcedOngRepository())
      ..lazyPut(
        () => OutsourcedFormController(
          Get.find(),
        ),
      );
  }
}
