import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> alphaAnimationValues;
  late Animation<double> scaleAnimationValues;
  late Animation<double> rotateAnimationValues;
  late Animation<double> translateAnimationValues;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: Duration(milliseconds: 3000), vsync: this);

    alphaAnimationValues =
        Tween(begin: 0.2, end: 1.0).animate(animationController)
          ..addListener(() {
            setState(() {});
          });

    scaleAnimationValues =
        Tween(begin: 128.0, end: 256.0).animate(animationController)
          ..addListener(() {
            setState(() {});
          });
    rotateAnimationValues =
        Tween(begin: 0.0, end: pi * 2).animate(animationController)
          ..addListener(() {
            setState(() {});
          });
    translateAnimationValues =
        Tween(begin: 0.0, end: 25.0).animate(animationController)
          ..addListener(() {
            setState(() {});
          });

    //animationController.forward(); Required method to start animation when the page is opened
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              Icons.wb_cloudy,
              color: Colors.white,
              size: scaleAnimationValues.value,
            ),
            Opacity(
              opacity: alphaAnimationValues.value,
              child: Icon(
                Icons.wb_incandescent_rounded,
                color: Colors.white,
                size: 128,
              ),
            ),
            Transform.rotate(
              angle: rotateAnimationValues.value,
              child: Text(
                'Weather',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Transform.translate(
              offset: Offset(0.0, translateAnimationValues.value),
              child: Text('Animation Text',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange)),
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  animationController.forward();
                },
                child: Text(
                  'Start',
                  style: TextStyle(fontSize: 20, color: Colors.white60),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
