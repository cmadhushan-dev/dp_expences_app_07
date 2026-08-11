import 'package:dp_expenz_application/constant/colors.dart';
import 'package:dp_expenz_application/constant/constatnt.dart';
import 'package:dp_expenz_application/model/expence_model.dart';
import 'package:dp_expenz_application/model/income_model.dart';
import 'package:dp_expenz_application/widgets/expences_card.dart';
import 'package:dp_expenz_application/widgets/income_card.dart';
import 'package:flutter/material.dart';

class TransactionsScreen extends StatefulWidget {
  //list from the main screen (expences)
  final List<ExpenceModel> expencesList;
  //list from the main screen (Incomes)
  final List<IncomeModel> incomeList;
  final void Function(ExpenceModel) onDissmissedExpense;
  final void Function(IncomeModel) onDissmissedIncome;
  const TransactionsScreen({
    super.key,
    required this.expencesList,
    required this.onDissmissedExpense,
    required this.onDissmissedIncome,
    required this.incomeList,
  });

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'See your financial report',
          style: TextStyle(color: kMainColor, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaulPadding,
            vertical: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Expences',
                style: TextStyle(
                  color: kBlack,
                  fontWeight: FontWeight.w800,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: MediaQuery.of(context).size.height * 0.31,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: kWhite,
                ),

                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: kDefaulPadding),
                    child: Column(
                      children: [
                        ListView.builder(
                          itemCount: widget.expencesList.length,
                          addAutomaticKeepAlives: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final expence = widget.expencesList[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Dismissible(
                                key: ValueKey(expence),
                                onDismissed: (direction) {
                                  setState(() {
                                    widget.onDissmissedExpense(expence);
                                  });
                                },
                                direction: DismissDirection.startToEnd,
                                child: ExpencesCard(
                                  amount: expence.expencePrize,
                                  mainTitle: expence.expenceMainTitle,
                                  subtitle: expence.expenceSubTitle,
                                  createdAt: expence.expenceTime,
                                  expencesCategaory: expence.category,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //income list
              const Text(
                'Incomes',
                style: TextStyle(
                  color: kBlack,
                  fontWeight: FontWeight.w800,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: MediaQuery.of(context).size.height * 0.32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: kWhite,
                ),

                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: kDefaulPadding),
                    child: Column(
                      children: [
                        ListView.builder(
                          itemCount: widget.incomeList.length,
                          addAutomaticKeepAlives: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final income = widget.incomeList[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Dismissible(
                                key: ValueKey(income),
                                onDismissed: (direction) {
                                  setState(() {
                                    widget.onDissmissedIncome(income);
                                  });
                                },
                                direction: DismissDirection.startToEnd,
                                child: IncomeCard(
                                  amount: income.incomePrize,
                                  mainTitle: income.incomeMainTitle,
                                  subtitle: income.incomeSubTitle,
                                  createdAt: income.incomeTime,
                                  incomeCategaries: income.category,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
