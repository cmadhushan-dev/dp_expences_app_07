import 'package:dp_expenz_application/constant/colors.dart';
import 'package:dp_expenz_application/constant/constatnt.dart';
import 'package:dp_expenz_application/model/expence_model.dart';
import 'package:dp_expenz_application/model/income_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatefulWidget {
  final Map<ExpenceCateraries, double> expencecategoryTotal;
  final Map<IncomeCategary, double> incomeCategoryTotal;
  final bool isExpence;

  const Chart({
    super.key,
    required this.expencecategoryTotal,
    required this.incomeCategoryTotal,
    required this.isExpence,
  });

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  //section data fro the pie chart
  List<PieChartSectionData> getScetionCharts() {
    if (widget.isExpence) {
      return [
        PieChartSectionData(
          color: expencesCategariesColors[ExpenceCateraries.food],
          value: widget.expencecategoryTotal[ExpenceCateraries.food] ?? 0,
          showTitle: false,
          radius: 60,
        ),

        PieChartSectionData(
          color: expencesCategariesColors[ExpenceCateraries.health],
          value: widget.expencecategoryTotal[ExpenceCateraries.health] ?? 0,
          showTitle: false,
          radius: 60,
        ),

        PieChartSectionData(
          color: expencesCategariesColors[ExpenceCateraries.shopping],
          value: widget.expencecategoryTotal[ExpenceCateraries.shopping] ?? 0,
          showTitle: false,
          radius: 60,
        ),

        PieChartSectionData(
          color: expencesCategariesColors[ExpenceCateraries.subscription],
          value:
              widget.expencecategoryTotal[ExpenceCateraries.subscription] ?? 0,
          showTitle: false,
          radius: 60,
        ),

        PieChartSectionData(
          color: expencesCategariesColors[ExpenceCateraries.transport],
          value: widget.expencecategoryTotal[ExpenceCateraries.transport] ?? 0,
          showTitle: false,
          radius: 60,
        ),
      ];
    } else {
      return [
        PieChartSectionData(
          color: incomeCategaryColors[IncomeCategary.freelance],
          value: widget.incomeCategoryTotal[IncomeCategary.freelance] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: incomeCategaryColors[IncomeCategary.passive],
          value: widget.incomeCategoryTotal[IncomeCategary.passive] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: incomeCategaryColors[IncomeCategary.salary],
          value: widget.incomeCategoryTotal[IncomeCategary.salary] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: incomeCategaryColors[IncomeCategary.sales],
          value: widget.incomeCategoryTotal[IncomeCategary.sales] ?? 0,
          showTitle: false,
          radius: 60,
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    //define the peichart data
    final PieChartData pieChart = PieChartData(
      sectionsSpace: 0,
      centerSpaceRadius: 70,
      startDegreeOffset: -90,
      sections: getScetionCharts(),
      borderData: FlBorderData(show: false),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Container(
        height: 250,
        padding: const EdgeInsets.all(kDefaulPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            PieChart(pieChart),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '70%',
                  style: TextStyle(color: kBlack, fontWeight: FontWeight.bold),
                ),
                Text("Of 100%", style: TextStyle(color: kGrey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
