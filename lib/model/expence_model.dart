import 'package:flutter/material.dart';

enum ExpenceCateraries { food, transport, health, shopping, subscription }

//expences categries with images
final Map<ExpenceCateraries, String> expencesImages = {
  ExpenceCateraries.food: "assets/imges/restaurant.png",
  ExpenceCateraries.health: "assets/imges/health.png",
  ExpenceCateraries.shopping: "assets/imges/bag.png",
  ExpenceCateraries.subscription: "assets/imges/bill.png",
  ExpenceCateraries.transport: "assets/imges/car.png",
};

//categary colors
final Map<ExpenceCateraries, Color> expencesCategariesColors = {
  ExpenceCateraries.food:Colors.red,
  ExpenceCateraries.health:Colors.blue,
  ExpenceCateraries.shopping:Colors.yellowAccent,
  ExpenceCateraries.subscription:Colors.pinkAccent,
  ExpenceCateraries.transport:Colors.black
};

class ExpenceModel {
  final int id;
  final String expenceMainTitle;
  final String expenceSubTitle;
  final double expencePrize;
  final DateTime expenceTime;
  final DateTime expenceDate;
  final ExpenceCateraries category;

  ExpenceModel({required this.id, required this.expenceMainTitle, required this.expenceSubTitle, required this.expencePrize, required this.expenceTime, required this.expenceDate, required this.category});

  
}
