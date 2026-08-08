import 'package:dp_expenz_application/constant/constatnt.dart';
import 'package:dp_expenz_application/model/expence_model.dart';
import 'package:dp_expenz_application/model/income_model.dart';
import 'package:flutter/material.dart';
import '../../constant/colors.dart';

class AddNewScreen extends StatefulWidget {
  const AddNewScreen({super.key});

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  //state to track expence or income
  int _selectedMethod = 0;

  IncomeCategary _incomeCategory = IncomeCategary.passive;
  ExpenceCateraries _expenceCatagory = ExpenceCateraries.health;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedMethod == 0 ? kRed : kGreen,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 32),
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.066,
                decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedMethod = 0;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: _selectedMethod == 0 ? kRed : kWhite,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 60,
                          ),
                          child: Text('Expences'),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedMethod = 1;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: _selectedMethod == 1 ? kGreen : kWhite,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 60,
                          ),
                          child: Text('Income'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //here the how much implimentation
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.12,
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'How much? ',
                      style: TextStyle(
                        color: kLightGrey,
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextField(
                      style: TextStyle(
                        color: kLightGrey,
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        hintText: ' 0',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: kLightGrey,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.28,
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: const BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Form(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Column(
                      children: [
                        //category selector dropdown
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            hintText: 'Category',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          items: _selectedMethod == 1
                              ? IncomeCategary.values.map((categary) {
                                  return DropdownMenuItem(
                                    value: categary,
                                    child: Text(categary.name),
                                  );
                                }).toList()
                              : ExpenceCateraries.values.map((categary) {
                                  return DropdownMenuItem(
                                    value: categary,
                                    child: Text(categary.name),
                                  );
                                }).toList(),
                          value: _selectedMethod == 0
                              ? _expenceCatagory
                              : _incomeCategory,
                          onChanged: (values) {
                            setState(() {
                              _selectedMethod == 0
                                  ? _expenceCatagory =
                                        values as ExpenceCateraries
                                  : _incomeCategory = values as IncomeCategary;
                            });
                           
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
