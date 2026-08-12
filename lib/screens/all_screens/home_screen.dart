import 'package:dp_expenz_application/constant/constatnt.dart';
import 'package:dp_expenz_application/services/user_service.dart';
import 'package:flutter/material.dart';
import '../../constant/colors.dart';
import '../../widgets/line_chart_sample.dart';
import '../../widgets/reusble_home_page_card.dart';

class HomeScreen extends StatefulWidget {
  final double expencesTotal;
  final double incomeTotal;
  const HomeScreen({
    super.key,
    required this.expencesTotal,
    required this.incomeTotal,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //fro stroe the username
  String userName = "";
  //variable to stor the totalof expences
  double totalOfTheExpence = 0;
  //variable to stor the totalof incomes
  double totalOfTheIncome = 0;
  @override
  void initState() {
    super.initState();
    //get the username from shared prefernces
    UserService.getTheUserName().then((value) {
      if (value['userName'] != null) {
        setState(() {
          userName = value['userName']!;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.32,
              width: double.infinity,
              decoration: BoxDecoration(
                color: kMainColor.withOpacity(0.4),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(32),
                  bottomLeft: Radius.circular(32),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 32,
                      horizontal: kDefaulPadding,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: CircleAvatar(
                            child: Image.asset('assets/imges/user.jpg'),
                          ),
                        ),
                        Text(
                          'welcome $userName',
                          style: const TextStyle(
                            color: kBlack,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications,
                            size: 30,
                            color: kMainColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ReusbleHomePageCard(
                        mainTitle: "Income",
                        subTitelPrice: widget.incomeTotal.toString(),
                        imgUrl: 'assets/imges/income.png',
                        containerColr: kGreen,
                      ),
                      ReusbleHomePageCard(
                        mainTitle: "Expences",
                        subTitelPrice: widget.expencesTotal.toString(),
                        imgUrl: 'assets/imges/expense.png',
                        containerColr: kRed,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaulPadding),
              child: Column(
                children: [
                  Text(
                    'Spend Frequency',
                    style: TextStyle(
                      color: kBlack,
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                  //the line chart
                   SizedBox(height: 24,),
                  LineChartSample(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
