import 'dart:math';

import 'package:bmicalculator/bmi_result.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale = true;
  double height = 80;
  int age = 18;
  int weight = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bmi Calculator"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: isMale ? Colors.blue : Colors.grey[400],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/male.jpg",
                            width: 70,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "MALE",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: !isMale ? Colors.blue : Colors.grey[400],
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/female.png",
                            width: 70,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "FEMALE",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        "${height.round()}",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 40,
                        ),
                      ),
                      Text(
                        "CM",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    value: height,
                    onChanged: (value) {
                      setState(() {
                        height = value;
                      });
                    },
                    max: 220,
                    min: 80,
                  )
                ],
              ),
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Age",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          "$age",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                                heroTag: "age--",
                                mini: true,
                                child: Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            FloatingActionButton(
                                heroTag: "age++",
                                mini: true,
                                child: Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Weight", style: TextStyle(fontSize: 25)),
                        Text(
                          "$weight",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: "weight--",
                              child: Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              mini: true,
                            ),
                            FloatingActionButton(
                              heroTag: "weight++",
                              child: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              mini: true,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
          Container(
            width: double.infinity,
            height: 60,
            color: Colors.blue,
            child: MaterialButton(
              child: Text("CALCULATE"),
              onPressed: () {
                double result = weight / pow(height / 100, 2);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BmiResultScreen(
                        age: age,
                        gender: isMale,
                        result: result.round(),
                      ),
                    ));
              },
            ),
          )
        ],
      ),
    );
  }
}
