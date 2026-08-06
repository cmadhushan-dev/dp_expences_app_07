import 'package:dp_expenz_application/services/user_service.dart';
import 'package:dp_expenz_application/widgets/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      //check the username is availble in the shared prefernces
      future: UserService.chechkUserName(),
      builder: (context, snapshot) {
        //if the snapshot is still waiting
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          //here  if has the user data make hadData true other wise false
          bool hasUserName = snapshot.data ?? false;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'Inter'),
            home: Wrapper(showMainScreenAccriginToTheOutput: hasUserName),
          );
        }
      },
    );
  }
}
