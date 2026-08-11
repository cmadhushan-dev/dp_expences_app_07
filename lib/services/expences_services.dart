import 'dart:convert';

import 'package:dp_expenz_application/model/expence_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExpencesServices {
  //list of expences
  //defin the key for storing expences in shared preferences
  static const String _expenceKey = 'expences';

  //method to save the expence in the shared prefernces
  static Future<void> saveDataToTheSharedPrefences(
    ExpenceModel expence,
    BuildContext context,
  ) async {
    try {
      //create the instance for shared prefernces
      SharedPreferences pres = await SharedPreferences.getInstance();
      List<String>? exixtingExpences = pres.getStringList(_expenceKey);

      //convert the exsting to the list of expences to a list of Expences objects
      List<ExpenceModel> exstingexpenceObject = [];

      if (exixtingExpences != null) {
        exstingexpenceObject = exixtingExpences
            .map((e) => ExpenceModel.fromJson(json.decode(e)))
            .toList();
      }

      //add the new expences to the list
      exstingexpenceObject.add(expence);

      //convert the list of expences object back to the list os strings
      List<String> updatedExpences = exstingexpenceObject
          .map((e) => json.encode(e.toJson()))
          .toList();
      //save the data in the shared preferences
      await pres.setStringList(_expenceKey, updatedExpences);
      //show the message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Expences Added Succsfullyy..'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (err) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Fail to add expences..'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  //load the expences
  Future<List<ExpenceModel>> loadExpences() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? exsitingExpences = pref.getStringList(_expenceKey);
    //convert the existing expences to a list of expences objects
    List<ExpenceModel> loadedExpences = [];
    if (exsitingExpences != null) {
      loadedExpences = exsitingExpences
          .map((e) => ExpenceModel.fromJson(json.decode(e)))
          .toList();
    }
    return loadedExpences;
  }

  //delete a Expence via using  the id

static  Future<void> deleteExpense(int id, BuildContext context) async {
    try {
      //instance

      SharedPreferences pref = await SharedPreferences.getInstance();
      List<String>? excitingExpences = pref.getStringList(_expenceKey);
      //convert to the dart list
      List<ExpenceModel> excistingExpenceObjects = [];
      if (excitingExpences != null) {
        excistingExpenceObjects = excitingExpences
            .map((e) => ExpenceModel.fromJson(json.decode(e)))
            .toList();

        excistingExpenceObjects.removeWhere((expence) => expence.id == id);
        List<String> updatedExpences = [];
        updatedExpences = excistingExpenceObjects
            .map((element) => json.encode(element.toJson()))
            .toList();
        //save the updated list of expences to shared prefernces
        await pref.setStringList(_expenceKey, updatedExpences);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Expence Delete sucfully..'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    } catch (err) {
      print(err.toString());
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Fail to delete  expences..'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }
}
