
import 'dart:math';
import 'package:anim/modal/modalclass.dart';
import 'package:flutter/material.dart';

class PlanetDetailScreen extends StatelessWidget {
  final Planet planet;

  const PlanetDetailScreen({Key? key, required this.planet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          planet.name,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/564x/8b/77/8e/8b778e1a9b105d64f4ac72c4cc73823e.jpg'),
            ),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://i.pinimg.com/474x/b1/c4/b4/b1c4b4af7537031ae17528b590a5de28.jpg'),
                    fit: BoxFit.cover)),
          ),
          Container(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50),
                    GestureDetector(
                      child: TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0, end: 12),
                        duration: Duration(seconds: 40),
                        builder: (context, value, child) {
                          return Transform.rotate(
                            angle: pi / 6 * value, // Rotation effect
                            child: Image.network(planet.image),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 16),

                    // Display the planet name
                    Text(
                      planet.name,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Position :  ${planet.position.toString()}",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      "Distance :  ${planet.distance.toString()}",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                     "Velocity : ${ planet.velocity.toString()}",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 10),

                    Text(
                      "Description :",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "        ${planet.description}",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),

                    Image.network(planet.image),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
