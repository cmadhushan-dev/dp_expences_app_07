import 'dart:convert';

import 'package:dp_expenz_application/model/income_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IncomeService {
  //define the key for storing incomes in the shared preference
  static const String _incomeKey = 'income_key';

  //method to save the expences in the shared prefernces
  static Future<void> saveDataInSharedPrefernces(
    IncomeModel income,
    BuildContext context,
  ) async {
    try {
      //create the insatnce with the shared prefernces
      SharedPreferences pref = await SharedPreferences.getInstance();
      //get the all data from the shared prefernces
      List<String>? excitingIncomeData = pref.getStringList(_incomeKey);
      //list for stroing the incomes
      List<IncomeModel> incomeObjectData = [];
      //convert the all of exciting incomes to the dart object
      if (excitingIncomeData != null) {
        incomeObjectData = excitingIncomeData
            .map((datas) => IncomeModel.fromJsonMethod(json.decode(datas)))
            .toList();
      }
      //add the new expences to the incomeObjectData List
      incomeObjectData.add(income);

      //convert the list of income objects to the list of strings
      List<String>? updatedIncomeList = incomeObjectData
          .map((ele) => json.encode(ele.toJsonMethod()))
          .toList();
      //save the data in the shared prefernces
      await pref.setStringList(_incomeKey, updatedIncomeList);

      //show the message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Incomes Added Succsfullyy..'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Fail to add Incomes..'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  //function to the load the data fro  the shred prefernces
  static Future<List<IncomeModel>> loadtheIncomes() async {
    SharedPreferences pres = await SharedPreferences.getInstance();
    List<String>? allIncomes = pres.getStringList(_incomeKey);
    //list that hold the all converted data from the json format
    List<IncomeModel> incomes = [];
    //convert the stringtype incomes to the dart object
    if (allIncomes != null) {
      incomes = allIncomes
          .map((e) => IncomeModel.fromJsonMethod(json.decode(e)))
          .toList();
    }
    return incomes;
  }

  //function to delete a income from the shared prefernces
  static Future<void> deleteAIncome(int id, BuildContext context) async {
    try {
      //instance from the shared prefernces
      SharedPreferences pref = await SharedPreferences.getInstance();
      //list to the load the all incomes
      List<String>? exceitingIncomes = pref.getStringList(_incomeKey);
      List<IncomeModel> incomeObject = [];
      if (exceitingIncomes != null) {
        incomeObject = exceitingIncomes
            .map(
              (toElement) => IncomeModel.fromJsonMethod(json.decode(toElement)),
            )
            .toList();
        //remove the data accroding to the id
        incomeObject.removeWhere((income) => income.id == id);
        List<String> updatedIncomes = [];
        //make the updated incomes in to the String list
        updatedIncomes = incomeObject
            .map((element) => json.encode(element.toJsonMethod()))
            .toList();
        //save the updated incomes list in the shared prefernces
        pref.setStringList(_incomeKey, updatedIncomes);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Income Delete succfully..'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    } catch (error) {
      print(error.toString());
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Fail to delete  Income..'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }
}
