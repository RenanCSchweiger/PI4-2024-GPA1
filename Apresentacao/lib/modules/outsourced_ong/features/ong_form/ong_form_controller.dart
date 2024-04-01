import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../lib.dart';

class OngFormController extends GetxController {
  OngFormController(
    this._outsourcedOngRepository,
  );

  final IOutsourcedOngRepository _outsourcedOngRepository;

  final formKey = GlobalKey<FormState>();

  final logoBytes = [].obs;
  final logoPath = ''.obs;

  late TextEditingController nomeController;
  late TextEditingController emailController;
  late TextEditingController telefoneController;
  late TextEditingController enderecoController;
  late TextEditingController descController;
  late TextEditingController pixController;
  late TextEditingController siteController;

  @override
  void onInit() {
    super.onInit();
    nomeController = TextEditingController();
    emailController = TextEditingController();
    telefoneController = TextEditingController();
    enderecoController = TextEditingController();
    descController = TextEditingController();
    pixController = TextEditingController();
    siteController = TextEditingController();
  }

  void submitForm(context) async {
    final request = OutsourcedOngFormRequest(
      tipo: 'ong',
      nome: nomeController.text,
      email: emailController.text,
      telefone: telefoneController.text,
      endereco: enderecoController.text,
      descricao: descController.text,
      pix: pixController.text,
      logo: logoPath(),
      site: siteController.text,
    );

    if (formKey.currentState!.validate()) {
      EcoLoading.show(context);
      final response = await _outsourcedOngRepository.postSendFormOng(request);
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
    }
  }

  Future<void> pickImage(context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);

      if (result == null) return;

      logoBytes(await _getImageBytes(result.files.first.path!));
      logoPath(result.files.first.path!);
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
