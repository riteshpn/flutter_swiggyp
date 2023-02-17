import 'package:all_advance/Login_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Forgot_Password extends StatefulWidget {
  const Forgot_Password({super.key});

  @override
  State<Forgot_Password> createState() => _Forgot_PasswordState();
}

class _Forgot_PasswordState extends State<Forgot_Password> {
  TextEditingController userForgotPasswordController = TextEditingController();
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
                  margin: EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextFormField(
                    controller: userForgotPasswordController,
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
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                      onPressed: () async {
                        var forgotPassword =
                            userForgotPasswordController.text.trim();
                        try {
                          FirebaseAuth.instance
                              .sendPasswordResetEmail(email: forgotPassword)
                              .then((value) => {
                                    print("send email"),
                                    Get.off(() => Login_screen())
                                  });
                        } on FirebaseAuthException catch (e) {
                          print("Error $e");
                        }
                      },
                      child: const Text(
                        'Forgot password',
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
