import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OutsourcedCardInfo extends StatelessWidget {
  const OutsourcedCardInfo({super.key});

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
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Ganhe a visibilidade de nossos usuários para sua empresa, nossa plataforma divulga sua terceirizada por um valor simbolico de ',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: '5 reais.',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
