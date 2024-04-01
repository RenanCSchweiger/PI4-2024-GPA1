import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../lib.dart';

class RegisterUserController extends GetxController {
  RegisterUserController(this._userRepository);

  final IUserRepository _userRepository;

  final formKey = GlobalKey<FormState>();
  final isTermsAccepteds = false.obs;
  final warningTerms = false.obs;

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController celphoneController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    celphoneController = TextEditingController();
    passwordController = TextEditingController();
  }

  void registerUser(context) async {
    final request = SingUpRequest(
      nome: nameController.text,
      email: emailController.text,
      telefone: celphoneController.text,
      senha: passwordController.text,
    );

    if (formKey.currentState!.validate() && isTermsAccepteds()) {
      EcoLoading.show(context);
      final response = await _userRepository.postSingUp(request);
      EcoLoading.hide();

      if (response) {
        Get.snackbar(
          "Sucesso!",
          "Usuário cadastrado com sucesso!",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(15),
        );
        Get.offAllNamed(AppRoutes.login);
      } else {
        Get.snackbar(
          "Erro!",
          "Erro ao efetuar o cadastro!",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(15),
        );
      }
    } else if (!isTermsAccepteds()) {
      warningTerms(true);
    }
  }
}
