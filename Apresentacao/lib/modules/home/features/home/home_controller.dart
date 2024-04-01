import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../lib.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  HomeController(
    this._homeRepository,
  );

  final IHomeRepository _homeRepository;

  final userData = LoginUserSave.empty().obs;

  late TabController tabController;

  final outsourcedList = <OutsourcedOngResponse>[].obs;
  final ongList = <OutsourcedOngResponse>[].obs;

  @override
  void onInit() async {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    userData(await loadUserData());

    getOutsourceds();
    getOngs();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void logOff() {
    clearUserData();
    userData(LoginUserSave.empty());
    Get.offAllNamed(AppRoutes.login);
  }

  Future<LoginUserSave?> loadUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userDataString = prefs.getString('userData');
    if (userDataString != null) {
      final userDataMap = jsonDecode(userDataString);
      return LoginUserSave.fromJson(userDataMap);
    }
    return null;
  }

  Future<void> clearUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userData'); // Remove a chave 'userData'
  }

  Future<void> getOutsourceds() async {
    final response = await _homeRepository.getAllCompanysByType('terceirizada');

    if (response != null) {
      outsourcedList(response);
    }
  }

  Future<void> getOngs() async {
    final response = await _homeRepository.getAllCompanysByType('ong');

    if (response != null) {
      ongList(response);
    }
  }

  Future<void> goToDetails(int idEmpresa) async {
    final response = await _homeRepository.getCompanyById(idEmpresa.toString());

    if (response != null) {
      Get.toNamed(AppRoutes.outsourcedOngDetails, arguments: response);
    } else {
      Get.snackbar(
        "Erro no sistema",
        "Erro no sistema, tente novamente mais tarde!",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(15),
      );
    }
  }
}
