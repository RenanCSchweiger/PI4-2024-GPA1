import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'outsourced_ong_details_controller.dart';

class OutsourcedOngDetailsPage extends GetView<OutsourcedOngDetailsController> {
  const OutsourcedOngDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final company = controller.companyDetails();
    return Obx(
      () => Scaffold(
        backgroundColor: const Color.fromARGB(255, 241, 241, 241),
        appBar: AppBar(
          title: Text(
            controller.companyDetails().nome,
            style: const TextStyle(
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (company.logo == null || company.logo == '')
                      Image.asset(
                        "assets/images/logo-outsourced.png",
                        width: Get.width * 0.50,
                      )
                    else
                      Image.memory(
                        Uint8List.fromList(base64.decode(company.logo!)),
                        width: Get.width * 0.50,
                      ),
                  ],
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: Get.width,
                  height: company.tipo == 'ong' ? 370 : 300,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 175, 217, 176),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 3),
                          blurRadius: 5,
                          spreadRadius: 0,
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          _listTile(
                            title: 'Descrição: ',
                            description: company.descricao,
                            maxLines: 4,
                          ),
                          const SizedBox(height: 8),
                          _listTile(title: 'E-mail: ', description: company.email, maxLines: 2),
                          const SizedBox(height: 8),
                          _listTile(title: 'Telefone: ', description: company.telefone, maxLines: 1),
                          const SizedBox(height: 8),
                          _listTile(title: 'Endereço: ', description: company.endereco, maxLines: 3),
                          const SizedBox(height: 8),
                          if (company.cnpj != null && company.cnpj != '' && company.tipo != 'ong')
                            _listTile(
                              title: 'CNPJ: ',
                              description: company.cnpj!,
                              maxLines: 2,
                            ),
                          const SizedBox(height: 8),
                          if (company.site != null && company.site != '')
                            _listTile(
                              title: 'Site: ',
                              description: company.site!,
                              maxLines: 2,
                            ),
                          const SizedBox(height: 8),
                          if (company.pix != null && company.pix != '' && company.tipo != 'terceirizada')
                            _listTile(
                              title: 'PIX: ',
                              description: company.pix!,
                              maxLines: 2,
                            ),
                          if (company.tipo == 'ong')
                            Column(
                              children: [
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () => controller.goToDonation(),
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
                                        'Doar para esta ONG',
                                        style: TextStyle(fontSize: 17),
                                      ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _listTile({required String title, required String description, required int maxLines}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: RichText(
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          children: [
            TextSpan(
              text: '$title ',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            TextSpan(
              text: description,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
