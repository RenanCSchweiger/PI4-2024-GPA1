import 'dart:io';

import 'package:eco_clico_app/lib.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OutsourcedFormController extends GetxController {
  OutsourcedFormController(
    this._iOutsourcedOngRepository,
  );

  final IOutsourcedOngRepository _iOutsourcedOngRepository;

  final formKey = GlobalKey<FormState>();

  final logoBytes = [].obs;
  final logoPath = ''.obs;

  final paymentReceiptImageBytes = [].obs;
  final paymentReceiptImagePath = ''.obs;

  final warningPhoto = false.obs;

  late TextEditingController nomeController;
  late TextEditingController emailController;
  late TextEditingController telefoneController;
  late TextEditingController cnpjController;
  late TextEditingController enderecoController;
  late TextEditingController descController;
  late TextEditingController siteController;

  @override
  void onInit() {
    super.onInit();
    nomeController = TextEditingController();
    emailController = TextEditingController();
    telefoneController = TextEditingController();
    cnpjController = TextEditingController();
    enderecoController = TextEditingController();
    descController = TextEditingController();
    siteController = TextEditingController();
  }

  void submitForm(context) async {
    final request = OutsourcedOngFormRequest(
      tipo: 'terceirizada',
      nome: nomeController.text,
      email: emailController.text,
      telefone: telefoneController.text,
      cnpj: cnpjController.text,
      endereco: enderecoController.text,
      descricao: descController.text,
      logo: logoPath(),
      comprovante: paymentReceiptImagePath(),
      site: siteController.text,
    );

    if (formKey.currentState!.validate() && paymentReceiptImageBytes().isNotEmpty) {
      EcoLoading.show(context);
      final response = await _iOutsourcedOngRepository.postSendFormOutsourced(request);
      EcoLoading.hide();

      if (response) {
        Get.snackbar(
          "Sucesso!",
          "Formulário de solicitação de cadastro enviado com sucesso!",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(15),
        );
        Get.offAllNamed(AppRoutes.login);
      } else {
        Get.snackbar(
          "Erro!",
          "Erro ao enviar formulário de cadastro!",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(15),
        );
      }
    } else if (paymentReceiptImageBytes.isEmpty) {
      warningPhoto(true);
    }
  }

  Future<void> pickImage(context, {required bool isLogo}) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);

      if (result == null) return;

      if (isLogo) {
        logoBytes(await _getImageBytes(result.files.first.path!));
        logoPath(result.files.first.path!);
      } else {
        paymentReceiptImageBytes(await _getImageBytes(result.files.first.path!));
        paymentReceiptImagePath(result.files.first.path!);
      }

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
}
