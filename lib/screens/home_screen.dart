
import 'dart:convert';
import 'dart:math';
import 'package:anim/modal/modalclass.dart';
import 'package:anim/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlanetListScreen extends StatefulWidget {
  @override
  _PlanetListScreenState createState() => _PlanetListScreenState();
}

class _PlanetListScreenState extends State<PlanetListScreen> {
  List<Planet> planets = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadPlanetData();
  }

  Future<void> loadPlanetData() async {
    try {
      String jsonString = await rootBundle.loadString('data/planets.json');
      final List<dynamic> jsonData = json.decode(jsonString);

      planets = jsonData.map((json) => Planet.fromJson(json)).toList();
    } catch (error) {
      debugPrint("Error loading planet data: $error");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Planets',
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
            child: SafeArea(
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : planets.isEmpty
                      ? Center(child: Text('No planets found!'))
                      : ListView.builder(
                          itemCount: planets.length,
                          itemBuilder: (context, index) {
                            final planet = planets[index];
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, bottom: 10, left: 15, right: 15),
                              child: Stack(
                                children: [
                                  Container(
                                    height: 120,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: Colors.white)),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PlanetDetailScreen(
                                                  planet: planet),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 120,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.white,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          TweenAnimationBuilder(
                                            tween: Tween<double>(begin: 0, end: 12),
                                            duration: Duration(seconds: 50),
                                            builder: (context, value, child) {
                                              return Transform.rotate(
                                                angle: pi / 6 * value, // Rotation effect
                                                child: Image.network(planet.image,height: 100,width: 100,),
                                              );
                                            },
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            planet.name,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
            ),
          ),
        ],
      ),
    );
  }
}
