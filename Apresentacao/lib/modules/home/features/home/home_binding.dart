import 'package:eco_clico_app/lib.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<IHomeRepository>(() => HomeRepository())
      ..lazyPut(
        () => HomeController(
          Get.find(),
        ),
      );
  }
}
