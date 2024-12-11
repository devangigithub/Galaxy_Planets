  // import 'dart:convert';
  // import 'package:flutter/services.dart';
  // import 'package:galaxy/modal/modalclass.dart';
  //
  // class PlanetService {
  //   Future<List<Planet>> fetchPlanets() async {
  //     final String response = await rootBundle.loadString('data/planet.json');
  //     final List<dynamic> data = json.decode(response);
  //     return data.map((planet) => Planet.fromJson(planet)).toList();
  //   }
  // }


//   import 'dart:convert';
//
// import 'package:flutter/services.dart';
// import 'package:galaxy/modal/modalclass.dart';
//
// class PlanetService {
//     Future<List<Planet>> fetchPlanets() async {
//       try {
//         final String response = await rootBundle.loadString('assets/planet.json');
//         print('File Loaded Successfully: $response'); // Debugging
//         final List<dynamic> data = json.decode(response);
//         print('Parsed JSON: $data'); // Debugging
//         return data.map((planet) => Planet.fromJson(planet)).toList();
//       } catch (e) {
//         print('Error: $e'); // Log any error
//         rethrow;
//       }
//     }
//   }


//   import 'dart:convert';
//
// import 'package:flutter/services.dart';
// import 'package:galaxy/modal/modalclass.dart';
//
// Future<List<Planet>> fetchPlanets() async {
//     try {
//       final String response = await rootBundle.loadString('data/planet.json');
//       final List<dynamic> data = json.decode(response);
//       return data.map((planet) => Planet.fromJson(planet)).toList();
//     } catch (e) {
//       print("Error parsing planet.json: $e");
//       return [];
//     }
//   }


//   import 'dart:convert';
//   import 'package:flutter/services.dart';
// import 'package:galaxy/modal/modalclass.dart';
//
//   class PlanetService {
//     Future<List<Planet>> fetchPlanets() async {
//       try {
//         final String response = await rootBundle.loadString('data/planet.json');
//         final List<dynamic> data = json.decode(response);
//         return data.map((planet) => Planet.fromJson(planet)).toList();
//       } catch (e) {
//         print("Error loading planets: $e");
//         return [];
//       }
//     }
//   }
