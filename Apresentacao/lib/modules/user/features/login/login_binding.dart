import 'package:eco_clico_app/lib.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<IUserRepository>(() => UserRepository())
      ..lazyPut(
        () => LoginController(
          Get.find(),
        ),
      );
  }
}
