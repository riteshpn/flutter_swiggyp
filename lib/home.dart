import 'dart:math';

import 'package:all_advance/searchd.dart';
import 'package:all_advance/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Homep extends StatefulWidget {
  const Homep({super.key});

  @override
  State<Homep> createState() => _HomepState();
}

class _HomepState extends State<Homep> {
  List item = [
    'assets/h5.png',
    'assets/g3.png',
    'assets/g3.png',
    'assets/g5.png',
    'assets/g6.png',
    'assets/g7.png',
  ];
  List text1 = [
    'Food',
    'Instamart',
    'Dineout',
    'Meat Delivery',
    'Hnad',
    'Genie',
  ];
  List imgarr = [
    'assets/h1.png',
    'assets/h2.png',
    'assets/h3.png',
    'assets/h4.png',
    'assets/h5.png',
    'assets/h6.png',
  ];
  var dishesres = ["KFC", "Mac'd", "SahiPaneer", "MuttonCurry", "ChickenCurry"];
  final random = Random();
// var rest = dishesres[random.nextInt(dishesres.length)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          elevation: 100,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.home,
                ),
                label: "home"),
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.bowlFood,
                ),
                label: "food"),
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.shop,
                ),
                label: "grocery"),
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.houseMedical,
                ),
                label: "giene"),
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.shopify,
                ),
                label: "Instamart"),
          ]),
      body: Stack(
        
        children: [
          Drawer(
            child: GestureDetector(child: Text("log out"),onTap: () {
              FirebaseAuth.instance.signOut();
              Get.off(()=>splashscreen());
            },),
          ),
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff213A50), Color(0xff071938)])),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.person_off_outlined,
                                color: Colors.orange,
                              ),
                              Text("Vikesh",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const Text(
                            "201,Second floor Hosapalya,Munneshara",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ]),
                    const Spacer(),
                    Container(
                      height: 30,
                      width: 55,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 5,
                                //spreadRadius: 2,
                                color: Colors.white)
                          ]),
                      child: const Center(
                        child: Text(
                          "one",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.account_circle,
                        size: 35,
                        color: Colors.orange,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange, width: 2.0),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Expanded(
                            child: TextField(
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search for",
                              hintStyle: TextStyle(
                                color: Colors.brown,
                              )),
                        )),
                        InkWell(
                          onTap: () =>
                              showSearch(context: context, delegate: Search1()),
                          child: const Icon(
                            Icons.search,
                            color: Colors.blueAccent,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.mic,
                          color: Colors.blueAccent,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    height: 250,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        itemCount: item.length,
                        itemBuilder: (
                          context,
                          index,
                        ) {
                          return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade400,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 3, bottom: 1),
                                        child: Image.asset(
                                          item[index],
                                          height: 80,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  text1[index],
                                  style: const TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          );
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Container(
                        child: Column(
                          children: const [
                            Text(
                              "SWIGGY",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.deepOrange),
                            ),
                            Text(
                              'One',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrange),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: const [
                            Text(
                              "Yay!You're Saved Rs1601 in",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text("almost 3 mo(s).Keep Saving!",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Container(
                            height: 35,
                            width: 70,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 243, 212, 231),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      blurRadius: 5,
                                      //spreadRadius: 2,
                                      color: Colors.white)
                                ]),
                            child: const Center(
                              child: Text(
                                "Explore",
                                style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    height: 250,
                    child: ListView.builder(
                      itemCount: imgarr.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: InkWell(
                                onTap: () {
                                  print("you tap on image why");
                                },
                                child: Container(
                                    height: 240,
                                    width: 270,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Image.asset(imgarr[index],
                                          fit: BoxFit.cover),
                                    )),
                              ),
                            ),
                          ],
                        );
                      },
                      itemExtent: 300,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
