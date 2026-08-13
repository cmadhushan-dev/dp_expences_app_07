import 'package:dp_expenz_application/constant/colors.dart';
import 'package:dp_expenz_application/constant/constatnt.dart';
import 'package:dp_expenz_application/model/expence_model.dart';
import 'package:dp_expenz_application/model/income_model.dart';
import 'package:dp_expenz_application/widgets/categary_cards.dart';
import 'package:dp_expenz_application/widgets/pie_chart.dart';
import 'package:flutter/material.dart';

class BudgetScreen extends StatefulWidget {
  final Map<ExpenceCateraries, double> expenceCategoryTotals;
  final Map<IncomeCategary, double> incomeCtegoryTotal;
  const BudgetScreen({
    super.key,
    required this.expenceCategoryTotals,
    required this.incomeCtegoryTotal,
  });

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  // variable toggle the screen
  int _currentScreen = 0;

  //method to define the category color from the category
  Color getCategoryColor(dynamic category) {
    if (category is ExpenceCateraries) {
      return expencesCategariesColors[category]!;
    } else {
      return incomeCategaryColors[category]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    //final data
    final data = _currentScreen == 0
        ? widget.expenceCategoryTotals
        : widget.incomeCtegoryTotal;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaulPadding),
          child: Column(
            children: [
              const Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Center(
                  child: Text(
                    'Financial Report',
                    style: TextStyle(
                      fontSize: 16,
                      color: kBlack,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                height: height * 0.07,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: kWhite,
                  boxShadow: [
                    BoxShadow(color: kBlack.withOpacity(0.2), blurRadius: 20),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentScreen = 0;
                        });
                      },
                      child: Container(
                        width: width * 0.46,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: _currentScreen == 0 ? kRed : kWhite,
                        ),
                        child: Center(
                          child: Text(
                            'Expence',
                            style: TextStyle(
                              color: _currentScreen == 0 ? kWhite : kBlack,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentScreen = 1;
                        });
                      },
                      child: Container(
                        width: width * 0.46,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: _currentScreen == 1 ? kGreen : kWhite,
                        ),
                        child: Center(
                          child: Text(
                            'Income',
                            style: TextStyle(
                              color: _currentScreen == 1 ? kWhite : kBlack,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.012),
              Chart(
                incomeCategoryTotal: widget.incomeCtegoryTotal,
                expencecategoryTotal: widget.expenceCategoryTotals,
                isExpence: _currentScreen == 0,
              ),

              //list of categaries
              SizedBox(
                height: height * 0.3,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final category = data.keys.toList()[index];
                    final total = data.values.toList()[index];
                    return CategaryCards(
                      title: category.name,
                      amount: total,
                      total: data.values.reduce(
                        (value, element) => value + element,
                      ),
                      progrossColor: getCategoryColor(category),
                      isexpence: _currentScreen == 0,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
