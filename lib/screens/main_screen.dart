import 'package:dp_expenz_application/constant/colors.dart';
import 'package:dp_expenz_application/model/expence_model.dart';
import 'package:dp_expenz_application/screens/all_screens/add_new_screen.dart';
import 'package:dp_expenz_application/screens/all_screens/budget_screen.dart';
import 'package:dp_expenz_application/screens/all_screens/home_screen.dart';
import 'package:dp_expenz_application/screens/all_screens/profile_screen.dart';
import 'package:dp_expenz_application/screens/all_screens/transactions_screen.dart';
import 'package:dp_expenz_application/services/expences_services.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //variable fro track the current page
  int _currentPage = 0;

  //list for fill the xpences
  List<ExpenceModel> expencesList = [];
  //function to fetch expences
  void fetchAllExpences() async {
    List<ExpenceModel> lodedExpences = await ExpencesServices().loadExpences();
    setState(() {
      expencesList = lodedExpences;
      print(expencesList.length);
    });
  }

  //function to add new expences
  void newExpencesAdding(ExpenceModel newExpences) {
    ExpencesServices.saveDataToTheSharedPrefences(newExpences, context);

    //update the list of expences
    setState(() {
      expencesList.add(newExpences);
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      fetchAllExpences();
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      AddNewScreen(addExpences: newExpencesAdding),
      const HomeScreen(),
      const TransactionsScreen(),
      const BudgetScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: (value) {
          setState(() {
            _currentPage = value;
            print(_currentPage);
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: kWhite,
        selectedItemColor: kMainColor,
        unselectedItemColor: kGrey,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          const BottomNavigationBarItem(
            icon: Icon(Icons.list_rounded),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: kMainColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: kWhite, size: 16),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.rocket),
            label: 'Budget',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: pages[_currentPage],
    );
  }
}
