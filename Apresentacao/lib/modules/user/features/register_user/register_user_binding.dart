import 'package:get/get.dart';

import '../../user.dart';

class RegisterUserBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<IUserRepository>(() => UserRepository())
      ..lazyPut(
        () => RegisterUserController(
          Get.find(),
        ),
      );
  }
}
