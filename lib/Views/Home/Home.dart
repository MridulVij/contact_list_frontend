import 'dart:io';

import 'package:contact_list_full_stack_app/Views/Auth/login_view.dart';
import 'package:contact_list_full_stack_app/Views/constants/colors/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController contact = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ylo,
        leading: IconButton(
            onPressed: Get.back, icon: Icon(Icons.arrow_back, color: blk)),
        actions: [
          IconButton(
              onPressed: () {
                //
                Get.to(LoginView());
              },
              icon: Icon(Icons.logout_outlined, color: blk))
        ],
        title: Text(
          "My Contact List",
          style: TextStyle(color: blk),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.normal),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(children: [
                  Container(
                    width: 250,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Add Contacts"),
                      controller: contact,
                    ),
                  ),
                  SizedBox(width: 18),
                  Container(
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Icon(Icons.add),
                      )),
                ]),
              ),
              Divider(color: gry2),

              // pending
              Column(
                children: [
                  ListTileWidget(),
                  ListTileWidget(),
                  ListTileWidget(),
                  ListTileWidget(),
                  ListTileWidget(),
                  ListTileWidget(),
                  ListTileWidget(),
                  ListTileWidget(),
                  ListTileWidget(),
                  ListTileWidget(),
                  ListTileWidget(),
                ],
              )
              // ui for list tile that displays contact no. in integer value and update icon with delete icon in it
            ],
          ),
        ),
      ),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: gry2),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 45),
                child: Text(
                  'Contact:',
                  style: TextStyle(color: splsclr),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('9138413616', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
          SizedBox(width: 130),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.edit, color: Colors.blue)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.delete, color: Colors.red))
        ],
      ),
    );
  }
}
