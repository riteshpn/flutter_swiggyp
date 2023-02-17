import 'package:all_advance/Login_Screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';


  sighnUpUser(
    String userName, 
    String userPhone, 
    String userEmail,
   String userPassword,
   )async{

    User? userid = FirebaseAuth.instance.currentUser;

   try {
    await FirebaseFirestore.instance.collection("users").doc(userid!.uid).set({
                                    'userName':userName,
                                    'userphn': userPhone,
                                    'userEmail':userEmail,
                                    'createdAt':DateTime.now(),
                                    'userId' : userid.uid

                                  }).then((value) => {
                                    FirebaseAuth.instance.signOut(),
                                    Get.to(()=>const Login_screen())
                                  });
     
   }on FirebaseAuthException catch (e) {

    print("Error $e");
     
   }
                                

   }