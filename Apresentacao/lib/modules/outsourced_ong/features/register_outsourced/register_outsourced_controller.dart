import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../lib.dart';

class RegisterOutsourcedController extends GetxController {
  RegisterOutsourcedController(
    this._iOutsourcedOngRepository,
  );

  final IOutsourcedOngRepository _iOutsourcedOngRepository;

  final formKey = GlobalKey<FormState>();

  final logoBytes = [0].obs;

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
    final request = RegisterOutsourcedOngRequest(
      tipo: 'terceirizada',
      nome: nomeController.text,
      email: emailController.text,
      telefone: telefoneController.text,
      cnpj: cnpjController.text,
      endereco: enderecoController.text,
      descricao: descController.text,
      logoEmpresa: logoBytes().length > 1 ? logoBytes() : [],
      pix: '',
      site: siteController.text,
    );

    if (formKey.currentState!.validate()) {
      EcoLoading.show(context);
      final response = await _iOutsourcedOngRepository.postRegisterOutsourcedOng(request);
      EcoLoading.hide();

      if (response) {
        Get.back();
        Get.snackbar(
          "Sucesso!",
          "Terceirizada cadastrada com sucesso!",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(15),
        );
      } else {
        Get.snackbar(
          "Erro!",
          "Erro ao cadastrar terceirizada!",
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
