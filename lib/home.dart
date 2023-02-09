import 'dart:math';

import 'package:flutter/material.dart';

class Homep extends StatefulWidget {
  const Homep({super.key});

  @override
  State<Homep> createState() => _HomepState();
}

class _HomepState extends State<Homep> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff213A50), Color(0xff071938)])),
          ),
          SafeArea(
            child: Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 140),
                          child: Row(
                            children: [
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
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "201,Second floor Hosapalya,Mun...",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: Container(
                        height: 30,
                        width: 55,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 5,
                                  //spreadRadius: 2,
                                  color: Colors.white)
                            ]),
                        child: Center(
                          child: Text(
                            "one",
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                          child: Icon(
                        Icons.account_circle,
                        size: 35,
                        color: Colors.orange,
                      )),
                    )
                  ],
                ),
              ),
            ),
          ),
          // this is a problem ..
          Text("aaaaaaaaaaaaa")
        ],
      ),
    );
  }
}


// search bar for 2nd widget in ui ....
class saerch1 extends StatefulWidget {
  const saerch1({super.key});

  @override
  State<saerch1> createState() => _saerch1State();
}

class _saerch1State extends State<saerch1> {
  @override
  Widget build(BuildContext context) {
    var dishesres = [
      "KFC",
      "Mac'd",
      "SahiPaneer",
      "MuttonCurry",
      "ChickenCurry"
    ];
    final _Random = new Random();
    var rest = dishesres[_Random.nextInt(dishesres.length)];

    return Column(
      children: [
        SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search for $rest",
                      hintStyle: TextStyle(
                        color: Colors.brown,
                      )),
                )),
                Container(
                  child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.search,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.mic,
                  color: Colors.blueAccent,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
