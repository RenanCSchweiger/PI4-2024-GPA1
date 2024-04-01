import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../lib.dart';

class RegisterUserPage extends GetView<RegisterUserController> {
  const RegisterUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 241, 241),
      appBar: AppBar(
        title: const Text(
          'Registrar-se',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 5,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Image.asset(
                  "assets/images/logo.png",
                  scale: 4,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: controller.nameController,
                  onChanged: (s) {},
                  decoration: InputDecoration(
                    hintText: 'Insira seu nome completo',
                    labelText: 'Nome completo',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                  ),
                  validator: (String? value) {
                    bool numbersOrSpecialCharacters = value != null ? RegExp(r'[0-9@#$]').hasMatch(value) : false;
                    if (value == null || value.isEmpty) {
                      return "Insira seu nome completo";
                    } else if (numbersOrSpecialCharacters) {
                      return "Nome inválido.";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    hintText: 'Insira seu email',
                    labelText: 'Email',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.length < 6 || !value.contains("@")) {
                      return "E-mail inválido.";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: controller.celphoneController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Insira seu telofone',
                    labelText: 'Telefone',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.length < 9) {
                      return "Número de telefone inválido";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(
                    hintText: 'Insira uma senha',
                    labelText: 'Senha',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.length < 6) {
                      return "A senha precisa ter mais de 6 digitos.";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                Obx(
                  () => Row(
                    children: [
                      Checkbox(
                        value: controller.isTermsAccepteds(),
                        onChanged: (value) => controller.isTermsAccepteds(value),
                      ),
                      Expanded(
                        child: Text(
                          'Aceito os termos e a politica de privacidade do aplicativo EcoCiclo.',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: controller.warningTerms() ? Colors.red : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () => controller.registerUser(context),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    elevation: MaterialStateProperty.all(5),
                    minimumSize: MaterialStateProperty.all(const Size(150, 50)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Registrar-se',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
