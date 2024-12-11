
import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen>  with TickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> sizeAnimate;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: Duration(seconds: 3))..repeat();
    sizeAnimate = Tween(begin: 10.0, end: 50.0).animate(_controller);


    Timer(Duration(seconds: 3),(){
          Navigator.of(context).pushReplacementNamed('home_screen');
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            // Container(
            //   height: double.infinity,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //       image: DecorationImage(
            //           image: NetworkImage(
            //               'https://i.pinimg.com/474x/b1/c4/b4/b1c4b4af7537031ae17528b590a5de28.jpg'),
            //           fit: BoxFit.cover)),
            // ),
            // TweenAnimationBuilder(
            //   tween: Tween<double>(begin: 0, end: 12),
            //   duration: Duration(seconds: 50),
            //   builder: (context, value, child) {
            //     return Transform.rotate(
            //       angle: pi / 6 * value, // Rotation effect
            //       child: Image.network("https://media.istockphoto.com/id/1271122894/photo/planet-earth-from-the-space-at-night.jpg?s=612x612&w=0&k=20&c=PU-_OdSqlMs47X3FKQQBEruZcI38QJ4XLPpYi9b7dJ4=",height: 100,width: 100,),
            //     );
            //   },
            // ),
            Container(
                height: double.infinity,
                width: double.infinity,
                child: Image.network(
                  "https://media.istockphoto.com/id/465324131/photo/blue-sunrise-and-star-view-of-earth-from-space.jpg?s=612x612&w=0&k=20&c=lPtkdeDy4_iFunwOznGA3ystJqGvWSxWP-6gi6eoKGI=",
                  fit: BoxFit.cover,
                )),
            Container(
              alignment: Alignment.center,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Text(
                    "Galaxy \n\t\t\t\t\t\tPlanets",
                    style: TextStyle(
                      fontSize: sizeAnimate.value,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}







