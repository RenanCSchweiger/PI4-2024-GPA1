import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../lib.dart';

class OutsourcedOngDonationController extends GetxController {
  OutsourcedOngDonationController(
    this._donationRepository,
  );

  final IDonationRepository _donationRepository;

  final companyDetails = OutsourcedOngResponse.empty().obs;
  final warningPhoto = false.obs;
  final comprovanteBytes = [0].obs;
  final formKey = GlobalKey<FormState>();
  final userData = LoginUserSave.empty().obs;
  late TextEditingController mensagemController;

  @override
  void onInit() async {
    super.onInit();
    mensagemController = TextEditingController();
    userData(await loadUserData());
    companyDetails(Get.arguments);
  }

  void submitDonation(context) async {
    final request = DonationRequest(
      idDoador: userData().id,
      idOng: companyDetails().id,
      comprovante: comprovanteBytes(),
      mensagem: mensagemController.text,
    );

    if (formKey.currentState!.validate() && comprovanteBytes().length > 2) {
      EcoLoading.show(context);
      final response = await _donationRepository.postSendDonation(request, false);
      EcoLoading.hide();
      warningPhoto(false);

      if (response) {
        Get.back();
        Get.snackbar(
          "Sucesso!",
          "Doação enviada com sucesso!",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(15),
        );
      } else {
        Get.snackbar(
          "Erro!",
          "Erro ao enviar doação!",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(15),
        );
      }
    } else if (comprovanteBytes().length < 2) {
      warningPhoto(true);
    }
  }

  Future<void> pickImage(context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);

      if (result == null) return;
      comprovanteBytes(await _getImageBytes(result.files.first.path!));

      warningPhoto(false);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  Future<List<int>> _getImageBytes(String imagePath) async {
    File imageFile = File(imagePath);
    if (await imageFile.exists()) {
      List<int> imageBytes = await imageFile.readAsBytes();
      return imageBytes;
    } else {
      return [];
    }
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
}
