import 'dart:convert';

import 'package:eco_clico_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  LoginController(
    this._userRepository,
  );

  final IUserRepository _userRepository;
  final formKey = GlobalKey<FormState>();

  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  Future<void> login(context) async {
    final request = LoginRequest(
      email: emailController.text,
      password: passwordController.text,
    );

    if (formKey.currentState!.validate()) {
      EcoLoading.show(context);
      final response = await _userRepository.postLogin(request);
      EcoLoading.hide();

      if (response != null) {
        saveUserData(
          LoginUserSave(
            id: response.id,
            nome: response.nome,
            email: response.email,
            isAdmin: response.isAdmin,
          ),
        );

        Get.offAllNamed(AppRoutes.home);
      } else {
        Get.snackbar(
          "Erro no login",
          "Usuário ou senha inválidos!",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(15),
        );
      }
    }
  }

  // Função para salvar a instância da classe loginUserSave no SharedPreferences
  Future<void> saveUserData(LoginUserSave user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userData = user.toJson(); // Converte para JSON
    final userDataString = jsonEncode(userData); // Converte para string
    await prefs.setString('userData', userDataString);
  }
}
