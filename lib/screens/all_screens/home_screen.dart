import 'package:dp_expenz_application/constant/constatnt.dart';
import 'package:dp_expenz_application/model/expence_model.dart';
import 'package:dp_expenz_application/services/user_service.dart';
import 'package:dp_expenz_application/widgets/expences_card.dart';
import 'package:flutter/material.dart';
import '../../constant/colors.dart';
import '../../widgets/line_chart_sample.dart';
import '../../widgets/reusble_home_page_card.dart';

class HomeScreen extends StatefulWidget {
  final List<ExpenceModel> expences;
  final double expencesTotal;
  final double incomeTotal;
  const HomeScreen({
    super.key,
    required this.expencesTotal,
    required this.incomeTotal,
    required this.expences,
  });

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaulPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Spend Frequency',
                    style: TextStyle(
                      color: kBlack,
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                  //the line chart
                  const SizedBox(height: 24),
                  const LineChartSample(),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Recent Transaction',
                        style: TextStyle(
                          color: kBlack,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: kMainColor.withOpacity(0.2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'See All',
                            style: TextStyle(
                              color: kMainColor.withOpacity(0.8),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  widget.expences.isEmpty
                      ? const Padding(
                          padding: EdgeInsets.only(top: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.note_add),
                              SizedBox(width: 8),
                              Text(
                                'Add Some Expences!',
                                style: TextStyle(
                                  color: kBlack,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          height: 250,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: SingleChildScrollView(
                            child: ListView.builder(
                              itemCount: widget.expences.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              addAutomaticKeepAlives: false,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                final expenceItem = widget.expences[index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: ExpencesCard(
                                    amount: expenceItem.expencePrize,
                                    mainTitle: expenceItem.expenceMainTitle,
                                    subtitle: expenceItem.expenceSubTitle,
                                    createdAt: expenceItem.expenceTime,
                                    expencesCategaory: expenceItem.category,
                                  ),
                                );
                              },
                            ),
                          ),
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
