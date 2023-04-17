import 'package:contact_list_full_stack_app/Views/constants/colors/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Views/Auth/login_view.dart';
import 'Views/Auth/on_boarding.dart';
import 'Views/Auth/signup_view.dart';
import 'Views/Home/Home.dart';
import 'Views/splash/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //home: HomeScreen(),
      home: Splash(),
    );
  }
}
