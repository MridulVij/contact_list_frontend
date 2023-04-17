import 'dart:convert';

import 'package:contact_list_full_stack_app/Views/Auth/login_view.dart';
import 'package:contact_list_full_stack_app/Views/Auth/signup_view.dart';
import 'package:contact_list_full_stack_app/Views/Home/Home.dart';
import 'package:contact_list_full_stack_app/Views/constants/icon_paths/icon_paths.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/colors/const_colors.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  //
  bool _isLoading = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.post(
      Uri.parse('https://contact-list-backend-wyol.onrender.com/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        // 'name': _nameController.text,
        'email': email.text,
        // 'phone': _mobileController.text,
        'password': password.text,
        // 'cpassword': _rePasswordController.text,
      }),
    );
    var jsonResponse = jsonDecode(response.body);
    var token = jsonResponse["status"];
    setState(() {
      _isLoading = false;
    });

    if (response.statusCode == 200) {
      // registration successful, display success message
      Get.snackbar('Login Successfully', 'Connected',
          backgroundColor: grn, snackPosition: SnackPosition.BOTTOM);
      Get.to(HomeScreen());
    } else {
      // registration failed, display error message

      Get.snackbar('Wrong Credentials', 'Please Enter Correct ID & Password',
          backgroundColor: red, snackPosition: SnackPosition.BOTTOM);
    }
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ylo,
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(
                color: blk,
              ))
            : SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Contact List',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 40)),
                    Text('Log In'),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Form(controller: email, hinttxt: 'Email'),
                          SizedBox(height: 10),
                          Form(controller: password, hinttxt: 'Password'),
                          SizedBox(height: 60),
                          GestureDetector(
                            onTap: () async {
                              final SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();
                              sharedPreferences.setString("email", email.text);
                              _login();
                            },
                            child: Button(
                              txt: 'Login In',
                              btnclr: blu,
                              txtclr: wyt,
                              splshclr: wyt,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text('OR'),
                          SizedBox(height: 10),
                          Button(
                            btnclr: wyt,
                            icon: google,
                            txt: 'Log In with Google',
                            splshclr: gry,
                          ),
                          SizedBox(height: 10),
                          Button(
                            btnclr: wyt,
                            icon: facebook,
                            txt: 'Log In with Facebook',
                            splshclr: gry,
                          )
                        ],
                      ),
                    ),
                    // navigation for login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('New User?'),
                        Padding(
                            padding: EdgeInsets.all(5),
                            child: InkWell(
                              child:
                                  Text('Sign Up', style: TextStyle(color: blu)),
                              onTap: () {
                                Get.to(SignupView());
                              },
                            )),
                      ],
                    )
                  ],
                ),
              ));
  }
}

//Form
class Form extends StatelessWidget {
  const Form({super.key, required this.controller, this.hinttxt});
  final controller;
  final hinttxt;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: wyt, borderRadius: BorderRadius.circular(30)),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hinttxt,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}

// //Button
// class Button extends StatelessWidget {
//   const Button(
//       {super.key,
//       this.icon,
//       this.txt,
//       this.txtclr,
//       this.btnclr,
//       this.splshclr,
//       this.onPress});
//   final icon;
//   final txt;
//   final txtclr;
//   final btnclr;
//   final splshclr;
//   final onPress;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 50,
//         decoration: BoxDecoration(
//             color: btnclr,
//             borderRadius: BorderRadius.circular(30),
//             border: Border.all(width: 1, color: gry)),
//         child: MaterialButton(
//           splashColor: splsclr,
//           child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//             Container(child: icon),
//             SizedBox(width: 8),
//             Text(txt,
//                 style: TextStyle(
//                     color: txtclr, fontWeight: FontWeight.bold, fontSize: 18))
//           ]),
//           onPressed: () {
//             onPress;
//           },
//         ));
//   }
// }
