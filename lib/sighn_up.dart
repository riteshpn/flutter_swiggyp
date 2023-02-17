import 'dart:developer';

import 'package:all_advance/Login_Screen.dart';
import 'package:all_advance/services/sighnupservices.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Sighn_up extends StatefulWidget {
  const Sighn_up({super.key});

  @override
  State<Sighn_up> createState() => _Sighn_upState();
}

class _Sighn_upState extends State<Sighn_up> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  User? currentUser = FirebaseAuth.instance.currentUser;

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Color.fromARGB(255, 138, 133, 133),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 20),
                  child: Container(
                    color: Colors.amber,
                    child: const Text(
                      'Login Screen With Swiggy One',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange),
                    ),
                  ),
                ),
                Container(
                  child: Lottie.asset(
                    "assets/96365-delivery-service-delivery-man.json",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextFormField(
                    controller: userNameController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: 'UserName',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextFormField(
                    controller: userPhoneController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        hintText: 'Phone',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextFormField(
                    controller: userEmailController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_sharp),
                        hintText: 'Email',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextFormField(
                    controller: userPasswordController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password_sharp),
                        hintText: 'Password',
                        suffixIcon: const Icon(Icons.visibility),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                      onPressed: () async{
                        var userName = userNameController.text.trim();
                        var userPhone = userPhoneController.text.trim();
                        var userEmail = userEmailController.text.trim();
                        var userPassword = userPasswordController.text.trim();

                      await  FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: userEmail, password: userPassword)
                            .then((value) => {
                                  log("user created"),
                                  sighnUpUser(
                                    userName,
                                    userPhone,
                                    userEmail,
                                    userPassword,
                                  )   

                                  
                                });
                                
                      },
                      child: const Text(
                        'Sign Up',
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => Login_screen());
                  },
                  child: Container(
                    child: const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Card(
                          color: Colors.grey,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Already have an account Login"),
                          )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
