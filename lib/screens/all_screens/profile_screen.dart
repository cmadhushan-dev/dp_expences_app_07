import 'package:dp_expenz_application/screens/on_board_screen.dart';
import 'package:dp_expenz_application/services/expences_services.dart';
import 'package:dp_expenz_application/services/income_service.dart';
import 'package:dp_expenz_application/services/user_service.dart';
import 'package:flutter/material.dart';
import '../../constant/colors.dart';
import '../../constant/constatnt.dart';
import '../../widgets/profile_page_settings_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: kGrey.withOpacity(0.3),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
            child: Column(
              children: [
                const Text(
                  'Logout?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 12),
                Text(
                  'Are you sure do you wanna logout?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: kGrey.withOpacity(0.5),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        backgroundColor: kMainColor,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'NO',
                        style: TextStyle(
                          color: kWhite,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kMainColor.withOpacity(0.6),
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                      ),
                      onPressed: () async {
                        //clear the user data
                        await UserService.removeTheUser();

                        if (context.mounted) {
                          //clear the all expence
                          await ExpencesServices.deleteAllExpences(context);
                          //clear the all incomes
                          await IncomeService.deleteAllIncomes(context);
                        }

                        //naviagte to the register screen(onBoarding screen)
                        if (context.mounted) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OnBoardScreen(),
                            ),
                            (route) => false,
                          );
                        }
                      },

                      child: const Text(
                        'YES',
                        style: TextStyle(
                          color: kWhite,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  //load the user name form the userServices.dart
  String userName = '';

  @override
  void initState() {
    super.initState();
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
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 50,
                    horizontal: kDefaulPadding,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: kMainColor.withOpacity(0.5),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset('assets/imges/user.jpg'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'UserName',
                            style: TextStyle(color: kGrey.withOpacity(0.9)),
                          ),

                          Text(
                            'welcome $userName',
                            style: const TextStyle(
                              color: kBlack,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit, size: 30),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const ProfilePageSettingsCard(
                    conarinerColor: kMainColor,
                    tileTitle: 'My Wallet',
                    iconName: Icons.wallet,
                    iconColor: kMainColor,
                  ),
                  const SizedBox(height: 12),
                  const ProfilePageSettingsCard(
                    conarinerColor: kMainColor,
                    tileTitle: 'Settings',
                    iconName: Icons.settings,
                    iconColor: kMainColor,
                  ),
                  const SizedBox(height: 12),
                  const ProfilePageSettingsCard(
                    conarinerColor: kMainColor,
                    tileTitle: 'Export data',
                    iconName: Icons.earbuds,
                    iconColor: kMainColor,
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                      _showBottomSheet(context);
                    },
                    child: const ProfilePageSettingsCard(
                      conarinerColor: kRed,
                      tileTitle: 'Logout',
                      iconName: Icons.logout,
                      iconColor: kRed,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
