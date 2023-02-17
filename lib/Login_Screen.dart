// ignore_for_file: unused_local_variable

import 'package:all_advance/forgotpass.dart';
import 'package:all_advance/home.dart';
import 'package:all_advance/sighn_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({super.key});

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  @override
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
                    controller: loginEmailController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_sharp),
                        hintText: 'Email',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextFormField(
                    controller: loginPasswordController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.password_sharp),
                        hintText: 'Password',
                        suffixIcon: const Icon(Icons.visibility),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                      onPressed: () async {
                        var loginEmail1 = loginEmailController.text.trim();
                        var loginPassword1= loginPasswordController.text.trim();
                        try {
                          final User? firebaseUser =(await FirebaseAuth.instance.signInWithEmailAndPassword(email:loginEmail1, password: loginPassword1)).user;
                          if(firebaseUser != null){
                            Get.to(()=> const Homep());

                          }else{
                            print("Check email and password");
                          }


                        } on FirebaseAuthException catch (e) {
                          print("Error $e");
                        }
                      },
                      child: const Text(
                        'Log In',
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => Forgot_Password());
                    },
                    child: Container(
                      child: const Card(
                        color: Colors.grey,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text("Forgot Password"),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => Sighn_up());
                  },
                  child: Container(
                    child: const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Card(
                          color: Colors.grey,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Dont't have an account Signup"),
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
