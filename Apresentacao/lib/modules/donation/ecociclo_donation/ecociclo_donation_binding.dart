import 'package:get/get.dart';

import '../../../lib.dart';

class EcocicloDonationBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<IDonationRepository>(() => DonationRepository())
      ..lazyPut(
        () => EcocicloDonationController(
          Get.find(),
        ),
      );
  }
}
