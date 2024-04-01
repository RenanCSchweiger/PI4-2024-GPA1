import 'package:get/get.dart';

import '../lib.dart';

class AppRoutes {
  AppRoutes._();

  static const home = '/';
  static const login = '/login';
  static const registerUser = '/registerUser';
  static const outsourcedForm = '/outsourcedForm';
  static const ongForm = '/ongForm';
  static const registerOutsourced = '/registerOutsourced';
  static const registerOng = '/registerOng';
  static const outsourcedOngDetails = '/outsourcedOngDetails';
  static const outsourcedOngDonation = '/outsourcedOngDonation';
  static const ecocicloDonation = '/ecocicloDonation';

  static final routes = [
    GetPage(
      name: login,
      page: LoginPage.new,
      binding: LoginBinding(),
    ),
    GetPage(
      name: registerUser,
      page: RegisterUserPage.new,
      binding: RegisterUserBinding(),
    ),
    GetPage(
      name: outsourcedForm,
      page: OutsourcedFormPage.new,
      binding: OutsourcedFormBinding(),
    ),
    GetPage(
      name: ongForm,
      page: OngFormPage.new,
      binding: OngFormBinding(),
    ),
    GetPage(
      name: home,
      page: HomePage.new,
      binding: HomeBinding(),
    ),
    GetPage(
      name: registerOutsourced,
      page: RegisterOutsourcedPage.new,
      binding: RegisterOutsourcedBinding(),
    ),
    GetPage(
      name: registerOng,
      page: RegisterOngPage.new,
      binding: RegisterOngBinding(),
    ),
    GetPage(
      name: outsourcedOngDetails,
      page: OutsourcedOngDetailsPage.new,
      binding: OutsourcedOngDetailsBinding(),
    ),
    GetPage(
      name: outsourcedOngDonation,
      page: OutsourcedOngDonationPage.new,
      binding: OutsourcedOngDonationBinding(),
    ),
    GetPage(
      name: ecocicloDonation,
      page: EcocicloDonationPage.new,
      binding: EcocicloDonationBinding(),
    ),
  ];
}
