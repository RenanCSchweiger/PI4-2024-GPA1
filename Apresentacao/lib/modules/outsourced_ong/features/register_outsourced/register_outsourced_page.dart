import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../lib.dart';

class RegisterOutsourcedPage extends GetView<RegisterOutsourcedController> {
  const RegisterOutsourcedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 241, 241),
      appBar: AppBar(
        title: const Text(
          'Cadastrar Terceirizada',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                width: Get.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: Get.width,
                        height: 60,
                        color: Colors.green,
                        child: const Text(
                          'Cadastrar',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.10),
                        child: Obx(
                          () => Form(
                            key: controller.formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: controller.nomeController,
                                  decoration: ecoInputDecoration(
                                    hintText: 'Insira o nome da empresa',
                                    labelText: 'Nome da empresa',
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "Insira o nome da empresa.";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 15),
                                TextFormField(
                                  controller: controller.emailController,
                                  decoration: ecoInputDecoration(
                                    hintText: 'Insira o email da empresa',
                                    labelText: 'Email',
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
                                  controller: controller.telefoneController,
                                  keyboardType: TextInputType.number,
                                  decoration: ecoInputDecoration(
                                    hintText: 'Insira o telefone da empresa',
                                    labelText: 'Telefone',
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
                                  controller: controller.cnpjController,
                                  decoration: ecoInputDecoration(
                                    hintText: 'Insira o CNPJ da empresa',
                                    labelText: 'CNPJ',
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "Insira o CNPJ da empresa.";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 15),
                                TextFormField(
                                  controller: controller.enderecoController,
                                  decoration: ecoInputDecoration(
                                    hintText: 'Insira o endereço da empresa',
                                    labelText: 'Endereço',
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "Insira o endereço da empresa.";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 15),
                                TextFormField(
                                  controller: controller.descController,
                                  decoration: ecoInputDecoration(
                                    hintText: 'Insira uma descrição',
                                    labelText: 'Descrição da empresa',
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "Insira o endereço da empresa.";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 15),
                                TextFormField(
                                  controller: controller.siteController,
                                  decoration: ecoInputDecoration(
                                    hintText: 'Insira o site da empresa',
                                    labelText: 'Site da empresa',
                                  ),
                                ),
                                const SizedBox(height: 25),
                                const Text(
                                  "Logo da empresa:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                if (controller.logoBytes().length > 1)
                                  Column(
                                    children: [
                                      const SizedBox(height: 10),
                                      Image.memory(
                                        Uint8List.fromList(controller.logoBytes()),
                                        width: Get.width * 0.20,
                                      ),
                                      const SizedBox(height: 10),
                                    ],
                                  ),
                                EcoButton(
                                  onPressed: () => controller.pickImage(context),
                                  text: 'Selecionar foto de logo',
                                  fontSize: 12,
                                ),
                                const SizedBox(height: 20),
                                EcoButton(
                                  onPressed: () => controller.submitForm(context),
                                  text: 'Cadastrar',
                                  fontSize: 17,
                                ),
                                const SizedBox(height: 30),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
