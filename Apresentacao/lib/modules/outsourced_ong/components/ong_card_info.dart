import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OngCardInfo extends StatelessWidget {
  const OngCardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      width: Get.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Card(
          color: Colors.white,
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Colors.green,
                  width: 15,
                ),
              ),
            ),
            child: const Text('Ganhe doações de nossos usuários para sua ONG, nossa plataforma divulga sua causa social.'),
          ),
        ),
      ),
    );
  }
}
