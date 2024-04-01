import 'package:get/get.dart';

import '../donation.dart';

class OutsourcedOngDonationBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<IDonationRepository>(() => DonationRepository())
      ..lazyPut(
        () => OutsourcedOngDonationController(
          Get.find(),
        ),
      );
  }
}
