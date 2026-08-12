import 'package:dp_expenz_application/constant/colors.dart';
import 'package:dp_expenz_application/model/expence_model.dart';
import 'package:dp_expenz_application/model/income_model.dart';
import 'package:dp_expenz_application/screens/all_screens/add_new_screen.dart';
import 'package:dp_expenz_application/screens/all_screens/budget_screen.dart';
import 'package:dp_expenz_application/screens/all_screens/home_screen.dart';
import 'package:dp_expenz_application/screens/all_screens/profile_screen.dart';
import 'package:dp_expenz_application/screens/all_screens/transactions_screen.dart';
import 'package:dp_expenz_application/services/expences_services.dart';
import 'package:dp_expenz_application/services/income_service.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //variable fro track the current page
  int _currentPage = 0;

  /* INCOMES HANDALING SECTION
         BY SHARED PREFERNCES*/

  //function to fetch the all incomes
  void fetchAllIncomes() async {
    //get the all data from the service class
    List<IncomeModel> loadIncomes = await IncomeService.loadtheIncomes();
    setState(() {
      incomesList = loadIncomes;
      print("${incomesList.length} income");
    });
  }

  //function to add a new income
  void addNewincome(IncomeModel income) {
    //fisrt save the incomes in to the shared prefernces
    IncomeService.saveDataInSharedPrefernces(income, context);
    print('addNewincome');
    setState(() {
      //add to list to the show in the uerinterface
      incomesList.add(income);
    });
  }

  //function to the delete a income
  void deleteAIncome(IncomeModel income) {
    IncomeService.deleteAIncome(income.id, context);
    setState(() {
      incomesList.remove(income);
    });
  }

  /* EXPENCES HANDALING SECTION
         BY SHARED PREFERNCES*/

  //function to fetch expences
  void fetchAllExpences() async {
    List<ExpenceModel> lodedExpences = await ExpencesServices().loadExpences();
    setState(() {
      expencesList = lodedExpences;
      print("${expencesList.length} expences");
    });
  }

  //function to add new expences
  void newExpencesAdding(ExpenceModel newExpences) {
    //add to the shared prefernces
    ExpencesServices.saveDataToTheSharedPrefences(newExpences, context);

    setState(() {
      //add to list to the show in the uerinterface
      expencesList.add(newExpences);
    });
  }

  //function to remove a expence
  void removeExpence(ExpenceModel expence) {
    ExpencesServices.deleteExpense(expence.id, context);
    setState(() {
      expencesList.remove(expence);
    });
  }

  //function to calculate the total of the expences
  double calTheTotalOftheExpences() {
    double total = 0;
    for (int i = 0; i < expencesList.length; i++) {
      total = expencesList[i].expencePrize + total;
    }
    return total;
  }

  //function to calculte the  total of the incomes
  double calTheTotalOfTheIncome() {
    double totalIncome = 0;
    for (int i = 0; i < incomesList.length; i++) {
      totalIncome += incomesList[i].incomePrize;
    }
    return totalIncome;
  }

  //list to hold the incomes
  List<IncomeModel> incomesList = [];
  //list for fill the expences
  List<ExpenceModel> expencesList = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      fetchAllExpences();
      fetchAllIncomes();
    });
  }

  //calculte the total of the expences
  Map<ExpenceCateraries, double> calculteExpenceCatagires() {
    Map<ExpenceCateraries, double> categoryTotal = {
      ExpenceCateraries.food: 0,
      ExpenceCateraries.health: 0,
      ExpenceCateraries.shopping: 0,
      ExpenceCateraries.subscription: 0,
      ExpenceCateraries.transport: 0,
    };

    for (ExpenceModel expence in expencesList) {
      categoryTotal[expence.category] =
          categoryTotal[expence.category]! + expence.expencePrize;
    }
    return categoryTotal;
  }

  //calculte the total of the Income categaries
  Map<IncomeCategary, double> calculteIncomeCatagires() {
    Map<IncomeCategary, double> categoryTotal = {
      IncomeCategary.freelance: 0,
      IncomeCategary.passive: 0,
      IncomeCategary.salary: 0,
      IncomeCategary.sales: 0,
    };

    for (IncomeModel income in incomesList) {
      categoryTotal[income.category] =
          categoryTotal[income.category]! + income.incomePrize;
    }
    return categoryTotal;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      BudgetScreen(
        expenceCategoryTotals: calculteExpenceCatagires(),
        incomeCtegoryTotal: calculteIncomeCatagires(),
      ),
      HomeScreen(
        expences: expencesList,
        expencesTotal: calTheTotalOftheExpences(),
        incomeTotal: calTheTotalOfTheIncome(),
      ),
      TransactionsScreen(
        incomeList: incomesList,
        onDissmissedIncome: deleteAIncome,
        expencesList: expencesList,
        onDissmissedExpense: removeExpence,
      ),
      AddNewScreen(addExpences: newExpencesAdding, addincome: addNewincome),

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
