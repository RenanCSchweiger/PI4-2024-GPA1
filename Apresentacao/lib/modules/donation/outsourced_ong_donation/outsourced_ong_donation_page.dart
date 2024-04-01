import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../lib.dart';

class OutsourcedOngDonationPage extends GetView<OutsourcedOngDonationController> {
  const OutsourcedOngDonationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 241, 241),
      appBar: AppBar(
        title: const Text(
          'Doação',
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (controller.companyDetails().logo == null || controller.companyDetails().logo == '')
                      Image.asset(
                        "assets/images/logo-outsourced.png",
                        width: Get.width * 0.50,
                      )
                    else
                      Image.memory(
                        Uint8List.fromList(base64.decode(controller.companyDetails().logo!)),
                        width: Get.width * 0.70,
                      ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Você ira doar para a ONG ${controller.companyDetails().nome}:',
                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Pix da ONG: ',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: '${controller.companyDetails().pix}',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Envie uma mensagem para a ONG juntamente ao comprovante de doação.',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Mensagem:',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    Form(
                      key: controller.formKey,
                      child: TextFormField(
                        controller: controller.mensagemController,
                        maxLines: 5,
                        decoration: ecoInputDecoration(
                          hintText: 'Insira uma mensagem',
                          labelText: 'Mensagem para a ONG',
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Insira uma mensagem para sua doação.";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            const Text(
                              'Comprovante de doação:',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 15),
                            if (controller.comprovanteBytes().length < 2)
                              Text(
                                'Envie o comprovante do PIX',
                                style: TextStyle(
                                  color: controller.warningPhoto() ? Colors.red : Colors.black,
                                ),
                              )
                            else
                              Column(
                                children: [
                                  Image.memory(
                                    Uint8List.fromList(controller.comprovanteBytes()),
                                    width: Get.width * 0.20,
                                  )
                                ],
                              ),
                            const SizedBox(height: 15),
                            EcoButton(
                              onPressed: () => controller.pickImage(context),
                              text: 'Selecionar comprovante',
                              fontSize: 12,
                            ),
                            const SizedBox(height: 25),
                            EcoButton(
                              onPressed: () => controller.submitDonation(context),
                              text: 'Enviar Doação',
                              fontSize: 12,
                            ),
                            const SizedBox(height: 40),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
