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
  IncomeCategary.freelance: const Color(0xffE57373),
  IncomeCategary.passive: Colors.green,
  IncomeCategary.salary: Colors.lightBlue,
  IncomeCategary.sales: Colors.yellowAccent,
};

class IncomeModel {
  final int id;
  final String incomeMainTitle;
  final String incomeSubTitle;
  final double incomePrize;
  final DateTime incomeTime;
  final DateTime incomeDate;
  final IncomeCategary category;

  IncomeModel({
    required this.id,
    required this.incomeMainTitle,
    required this.incomeSubTitle,
    required this.incomePrize,
    required this.incomeTime,
    required this.incomeDate,
    required this.category,
  });

  //method to convert the data object to the json object
  Map<String, dynamic> toJsonMethod() {
    return {
      'incomeId':id,
      'incomeMainTitle':incomeMainTitle,
      'incomeSubTitle':incomeSubTitle,
      'incomePrize':incomePrize,
      'incomeTime':incomeTime.toIso8601String(),
      'incomeDate':incomeDate.toIso8601String(),
      'incomeCategory':category.index,

    };
  }

  //method to convert the json data to the dart object
  factory IncomeModel.fromJsonMethod(Map<String,dynamic> jsonIncomeData )
  {
    return IncomeModel(
      id: jsonIncomeData['incomeId'],
      incomeMainTitle: jsonIncomeData['incomeMainTitle'],
      incomeSubTitle: jsonIncomeData['incomeSubTitle'],
      incomePrize: jsonIncomeData['incomePrize'], 
      incomeTime: DateTime.parse(jsonIncomeData['incomeTime']),
      incomeDate: DateTime.parse(jsonIncomeData['incomeDate']), 
      category: IncomeCategary.values[jsonIncomeData['incomeCategory']]);
  }
}
