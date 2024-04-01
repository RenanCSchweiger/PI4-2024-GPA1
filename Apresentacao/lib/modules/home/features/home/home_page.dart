import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../lib.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: const Color.fromARGB(255, 241, 241, 241),
        appBar: AppBar(
          title: const Text(
            'EcoCiclo',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
          elevation: 2,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          actions: [
            Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                );
              },
            ),
          ],
          bottom: TabBar(
            controller: controller.tabController,
            labelColor: Colors.white,
            indicatorWeight: 3,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.white,
            labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            unselectedLabelColor: const Color.fromARGB(255, 17, 52, 19).withOpacity(0.7),
            tabs: const [
              Tab(text: 'Terceirizadas'),
              Tab(text: 'ONGS'),
            ],
          ),
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 100,
                child: DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.green,
                  ),
                  child: Text(
                    controller.userData().email,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: controller.userData().isAdmin,
                child: ListTile(
                  title: const Text('Cadastrar terceirizada'),
                  leading: const Icon(Icons.domain_add),
                  onTap: () {
                    Get.toNamed(AppRoutes.registerOutsourced)!.then((result) {
                      controller.onInit();
                    });
                  },
                ),
              ),
              Visibility(
                visible: controller.userData().isAdmin,
                child: ListTile(
                  title: const Text('Cadastrar ONG'),
                  leading: const Icon(Icons.add_home_work_outlined),
                  onTap: () {
                    Get.toNamed(AppRoutes.registerOng)!.then((result) {
                      controller.onInit();
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Doar para a EcoCiclo'),
                leading: const Icon(Icons.pix),
                onTap: () => Get.toNamed(AppRoutes.ecocicloDonation),
              ),
              ListTile(
                title: const Text('Sair'),
                leading: const Icon(Icons.logout),
                onTap: () => controller.logOff(),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller.tabController,
          children: [
            OutsourcedOngTab(
              companyList: controller.outsourcedList(),
              goToDetails: controller.goToDetails,
            ),
            OutsourcedOngTab(
              companyList: controller.ongList(),
              goToDetails: controller.goToDetails,
            ),
          ],
        ),
      ),
    );
  }
}
