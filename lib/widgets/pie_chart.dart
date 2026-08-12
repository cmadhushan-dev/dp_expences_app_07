import 'package:dp_expenz_application/model/expence_model.dart';
import 'package:dp_expenz_application/model/income_model.dart';
import 'package:flutter/material.dart';

class PieChart extends StatefulWidget {
  final Map<ExpenceCateraries, double> expencecategoryTotal;
  final Map<IncomeCategary, double> incomeCategoryTotal;
  final bool isExpence;

  const PieChart({
    super.key,
    required this.expencecategoryTotal,
    required this.incomeCategoryTotal,
    required this.isExpence,
  });

  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
