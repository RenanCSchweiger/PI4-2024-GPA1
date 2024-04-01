import 'package:get/get.dart';

import '../../../../lib.dart';

class OutsourcedOngDetailsController extends GetxController {
  OutsourcedOngDetailsController();

  final companyDetails = OutsourcedOngResponse.empty().obs;

  @override
  void onInit() async {
    super.onInit();
    companyDetails(Get.arguments);
  }

  void goToDonation() {
    Get.toNamed(AppRoutes.outsourcedOngDonation, arguments: companyDetails());
  }
}
