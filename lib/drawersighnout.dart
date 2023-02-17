import 'package:all_advance/Login_Screen.dart';
import 'package:all_advance/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class sighOut extends StatelessWidget {
  const sighOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Drawer(
        child: GestureDetector(
          child: SafeArea(child: Text("sign Out")),
          onTap: () {
            FirebaseAuth.instance.signOut();
            Get.off(() => Login_screen());
          },
        ),
      ),
    );
  }
}
