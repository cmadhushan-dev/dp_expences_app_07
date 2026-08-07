import 'package:flutter/material.dart';


//incoome categary
enum IncomeCategary { freelance, salary, passive, sales }

//categary imges
final Map<IncomeCategary, String> incomeCategaryImages = {
  IncomeCategary.freelance: "assets/imges/freelance.png",
  IncomeCategary.passive: "assets/imges/car.png",
  IncomeCategary.salary: "assets/imges/health.png",
  IncomeCategary.sales: "assets/imges/salary.png",
};

//categary colors
final Map<IncomeCategary, Color> incomeCategaryColors = {

  IncomeCategary.freelance:const Color(0xffE57373),
  IncomeCategary.passive:Colors.green,
  IncomeCategary.salary:Colors.lightBlue,
  IncomeCategary.sales:Colors.yellowAccent ,
};

class IncomeModel {
  final int id;
  final String incomeMainTitle;
  final String incomeSubTitle;
  final double incomePrize;
  final DateTime incomeTime;
  final DateTime eincomeDate;
  final IncomeCategary category;

  IncomeModel({required this.id, required this.incomeMainTitle, required this.incomeSubTitle, required this.incomePrize, required this.incomeTime, required this.eincomeDate, required this.category});

 
}
