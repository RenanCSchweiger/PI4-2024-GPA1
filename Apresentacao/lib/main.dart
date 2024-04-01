import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'lib.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Certifica-se de que os widgets estão inicializados
  final loginUser = await loadUserData();
  final initialRoute = (loginUser != null) ? AppRoutes.home : AppRoutes.login;

  runApp(
    MyApp(initialRoute: initialRoute),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.initialRoute});

  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EcloCiclo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      initialRoute: initialRoute,
      getPages: AppRoutes.routes,
    );
  }
}

// Função para carregar a instância da classe loginUserSave do SharedPreferences
Future<LoginUserSave?> loadUserData() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final userDataString = prefs.getString('userData');
  if (userDataString != null) {
    final userDataMap = jsonDecode(userDataString);
    return LoginUserSave.fromJson(userDataMap);
  }
  return null;
}
