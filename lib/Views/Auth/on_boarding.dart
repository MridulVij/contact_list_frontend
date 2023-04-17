import 'package:contact_list_full_stack_app/Views/Auth/login_view.dart';
import 'package:contact_list_full_stack_app/Views/Auth/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors/const_colors.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ylo,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Contact List',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Get.to(LoginView());
                      },
                      child: Text('Log In')),
                  SizedBox(width: 20),
                  ElevatedButton(
                      onPressed: () {
                        Get.to(SignupView());
                      },
                      child: Text('Sign Up')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
