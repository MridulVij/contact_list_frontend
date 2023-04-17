import 'dart:async';

import 'package:contact_list_full_stack_app/Views/Auth/login_view.dart';
import 'package:contact_list_full_stack_app/Views/Auth/on_boarding.dart';
import 'package:contact_list_full_stack_app/Views/Auth/signup_view.dart';
import 'package:contact_list_full_stack_app/Views/Home/Home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:contact_list_full_stack_app/Views/constants/colors/const_colors.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String? finalEmail;
  @override
  void initState() {
    // TODO: implement initState
    getValidationData().whenComplete(() async {
      Timer(Duration(seconds: 3),
          () => Get.to(finalEmail == null ? LoginView() : HomeScreen()));
    });
    super.initState();
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('email');
    setState(() {
      finalEmail = obtainedEmail;
    });
    print(finalEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ylo,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text('My Contact List App',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
            ),
            //Spacer(),
            SizedBox(height: 90),
            CircularProgressIndicator(color: blk),
          ],
        ));
  }
}
