import 'package:flutter/material.dart';

import '../home.dart';

class OutsourcedOngTab extends StatelessWidget {
  const OutsourcedOngTab({
    super.key,
    required this.companyList,
    required this.goToDetails,
  });

  final List<OutsourcedOngResponse> companyList;
  final Function(int id) goToDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 241, 241, 241),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              ...companyList
                  .map(
                    (e) => GestureDetector(
                      onTap: () => goToDetails(e.id),
                      child: OutsourcedOngComponent(company: e),
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
