import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  //method to store the username,email in share preference
  static Future<void> storeUserDetails({
    required BuildContext context,
    required String userName,
    required String userEmail,
    required String password,
    required String confirmPassword,
  }) async {
    //checke whether the user enterd password=confrima password are the safe
    try {
      if (password != confirmPassword) {
        //show a message to the user
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Password and confirm password dont match'),
            ),
          );
          return;
        }
      }
      //create a shared preferce insatnce
      SharedPreferences prefes = await SharedPreferences.getInstance();
      //store the username and email as key value pair
      await prefes.setString('userName', userName);
      await prefes.setString('userEmail', userEmail);

      //show a message to user
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("userdetails stored succfully..")),
        );
      }
    } catch (error) {
      error.toString();
    }
  }

  //method for check whether the username is saved in the shared prefernces
  static Future<bool> chechkUserName() async {
    //cretae the instance of shared prefernce
    SharedPreferences pres = await SharedPreferences.getInstance();
    String? userName = pres.getString('userName');
    return userName != null;
  }
}
