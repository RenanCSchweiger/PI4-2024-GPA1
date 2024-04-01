import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../lib.dart';

class OngFormPage extends GetView<OngFormController> {
  const OngFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 241, 241),
      appBar: AppBar(
        title: const Text(
          'ONG',
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
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const EcoInfoCardWithLogo(
                  text: "Preencha o formulário para solicitar a participação da sua ONG em nossa plataforma.",
                ),
                const SizedBox(height: 15),
                const OngCardInfo(),
                const SizedBox(height: 15),
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
                            'Formulário',
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
                          child: Form(
                            key: controller.formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: controller.nomeController,
                                  decoration: ecoInputDecoration(
                                    hintText: 'Insira o nome da ONG',
                                    labelText: 'Nome da ONG',
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "Insira o nome da ONG.";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 15),
                                TextFormField(
                                  controller: controller.emailController,
                                  decoration: ecoInputDecoration(
                                    hintText: 'Insira o email da ONG',
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
                                    hintText: 'Insira o telefone da ONG',
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
                                  controller: controller.enderecoController,
                                  decoration: ecoInputDecoration(
                                    hintText: 'Insira o endereço da ONG',
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
                                    labelText: 'Descrição/Razão social',
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "Insira uma descrição.";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 15),
                                TextFormField(
                                  controller: controller.pixController,
                                  decoration: ecoInputDecoration(
                                    hintText: 'Insira o Pix da ONG',
                                    labelText: 'Pix da ONG',
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "Insira um pix válido.";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 15),
                                TextFormField(
                                  controller: controller.siteController,
                                  decoration: ecoInputDecoration(
                                    hintText: 'Insira o site da ONG',
                                    labelText: 'Site da ONG',
                                  ),
                                ),
                                const SizedBox(height: 25),
                                const Text(
                                  "Logo da ONG:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                if (controller.logoBytes().isNotEmpty)
                                  Column(
                                    children: [
                                      const SizedBox(height: 10),
                                      Image.memory(
                                        Uint8List.fromList(controller.logoBytes() as List<int>),
                                        width: Get.width * 0.20,
                                      )
                                    ],
                                  ),
                                EcoButton(
                                  onPressed: () => controller.pickImage(context),
                                  text: 'Selecionar foto de logo',
                                  fontSize: 12,
                                ),
                                const SizedBox(height: 20),
                                const Divider(
                                  thickness: 2,
                                ),
                                const SizedBox(height: 25),
                                ElevatedButton(
                                  onPressed: () => controller.submitForm(context),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.green),
                                    foregroundColor: MaterialStateProperty.all(Colors.white),
                                    elevation: MaterialStateProperty.all(5),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    'Enviar formulário',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                                const SizedBox(height: 30),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
