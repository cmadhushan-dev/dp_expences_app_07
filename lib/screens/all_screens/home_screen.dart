import 'package:dp_expenz_application/constant/constatnt.dart';
import 'package:dp_expenz_application/services/user_service.dart';
import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../../widgets/reusble_home_page_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //fro stroe the username
  String userName = "";

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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ReusbleHomePageCard(
                        mainTitle: "Income",
                        subTitelPrice: "5000",
                        imgUrl: 'assets/imges/income.png',
                        containerColr: kGreen,
                      ),
                      ReusbleHomePageCard(
                        mainTitle: "Expences",
                        subTitelPrice: "1200",
                        imgUrl: 'assets/imges/expense.png',
                        containerColr: kRed,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
