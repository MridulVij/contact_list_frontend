import 'dart:convert';

import 'package:contact_list_full_stack_app/Views/Auth/login_view.dart';
import 'package:contact_list_full_stack_app/Views/Home/Home.dart';
import 'package:contact_list_full_stack_app/Views/constants/icon_paths/icon_paths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constants/colors/const_colors.dart';
import 'config.dart';

class SignupView extends StatefulWidget {
  SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

//   //signup implimentation
//   bool isNotValidate = false;
//   // post request
//   Future<void> registerUser() async {
//     if (email.text.isNotEmpty && password.text.isNotEmpty) {
//       var regBody = {"email": email.text, "password": password.text};
//       // response for taking response from server / api
//       var response = await http.post(
//           Uri.parse('https://contact-list-backend-wyol.onrender.com/register'),
//           headers: {"Content-Type": "application/json"},
//           body: jsonEncode(regBody));
//       var jsonResponse = jsonDecode(response.body);
// // printing response
//       print(jsonResponse['status']);

//       if (jsonResponse['status'] == true) {
//         Get.to(() => HomeScreen());
//       } else {
//         print("Something went wrong");
//       }
//     } else {
//       setState(() {
//         isNotValidate = true;
//       });
//     }
//   }

//

  bool _isLoading = false;

  Future<void> _register() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.post(
      Uri.parse('https://contact-list-backend-wyol.onrender.com/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email.text,
        'password': password.text,
      }),
    );
    //decoded response from api for ex - "status" == true
    var jsonResponse = jsonDecode(response.body);
    var token = jsonResponse["status"];
    setState(() {
      _isLoading = false;
    });

    if (response.statusCode == 200) {
      // registration successful, display success message
      Get.snackbar(
          'Account Created Successfully', 'Login with your details now!',
          backgroundColor: grn, snackPosition: SnackPosition.BOTTOM);
      Get.to(LoginView());
    } else {
      // registration failed, display error message
      Get.snackbar(
          'Please Enter Correct Details', 'Email ID & Password is Wrong!',
          backgroundColor: red, snackPosition: SnackPosition.BOTTOM);
    }
  }
//

  //ends here
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
                    Text('Sign Up'),
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
                            onTap: () {
                              _register();
                            },
                            child: Button(
                              txt: 'Sign up',
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
                            txt: 'Sign Up with Google',
                            splshclr: gry,
                          ),
                          SizedBox(height: 10),
                          Button(
                            btnclr: wyt,
                            icon: facebook,
                            txt: 'Sign Up with Facebook',
                            splshclr: gry,
                          )
                        ],
                      ),
                    ),
                    // navigation for login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already Have an Account?'),
                        Padding(
                            padding: EdgeInsets.all(5),
                            child: InkWell(
                              child:
                                  Text('Log In', style: TextStyle(color: blu)),
                              onTap: () {
                                Get.back();
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

//Button
class Button extends StatelessWidget {
  const Button(
      {super.key,
      this.icon,
      this.txt,
      this.txtclr,
      this.btnclr,
      this.splshclr});
  final icon;
  final txt;
  final txtclr;
  final btnclr;
  final splshclr;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: btnclr,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(width: 1, color: gry)),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(child: icon),
        SizedBox(width: 8),
        Text(txt,
            style: TextStyle(
                color: txtclr, fontWeight: FontWeight.bold, fontSize: 18))
      ]),
    );
  }
}
