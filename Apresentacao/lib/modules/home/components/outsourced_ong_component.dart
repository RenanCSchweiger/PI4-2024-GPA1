import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../lib.dart';

class OutsourcedOngComponent extends StatelessWidget {
  const OutsourcedOngComponent({
    super.key,
    required this.company,
  });

  final OutsourcedOngResponse company;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: Get.width,
          height: 170,
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
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 8),
              if (company.logo == null || company.logo == '')
                Image.asset(
                  "assets/images/logo-outsourced.png",
                  width: Get.width * 0.24,
                )
              else
                Image.memory(
                  Uint8List.fromList(base64.decode(company.logo!)),
                  width: Get.width * 0.24,
                ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _listTile(
                      title: 'Nome:',
                      description: company.nome,
                      maxLines: 2,
                    ),
                    _listTile(
                      title: 'Endereço: ',
                      description: company.endereco,
                      maxLines: 3,
                    ),
                    _listTile(
                      title: 'Telefone: ',
                      description: company.telefone,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15)
      ],
    );
  }
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
            ),
          ),
          TextSpan(
            text: description,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  );
}
