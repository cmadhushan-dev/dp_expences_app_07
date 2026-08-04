import 'package:dp_expenz_application/constant/colors.dart';
import 'package:dp_expenz_application/data/onboarding_data.dart';
import 'package:dp_expenz_application/onboarding/front_page.dart';
import 'package:dp_expenz_application/onboarding/widgets/shared_onboarding_screen.dart';
import 'package:dp_expenz_application/screens/user_data_screen.dart';
import 'package:dp_expenz_application/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  //page dot controller
  final PageController _controller = PageController();
  //show details page
  bool showDetails = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      //this track the current index of the page if equal make bool
                      //value to the true if true chmange the text
                      showDetails = index == 3;
                      print(showDetails);
                    });
                  },
                  scrollDirection: Axis.horizontal,
                  children: [
                    const FrontPage(),
                    SharedOnboardingScreen(
                      imagesUrl: OnboardingData.onBoardingData[0].imageurl,
                      mainTitle: OnboardingData.onBoardingData[0].title,
                      description: OnboardingData.onBoardingData[0].description,
                    ),
                    SharedOnboardingScreen(
                      imagesUrl: OnboardingData.onBoardingData[1].imageurl,
                      mainTitle: OnboardingData.onBoardingData[1].title,
                      description: OnboardingData.onBoardingData[1].description,
                    ),
                    SharedOnboardingScreen(
                      imagesUrl: OnboardingData.onBoardingData[2].imageurl,
                      mainTitle: OnboardingData.onBoardingData[2].title,
                      description: OnboardingData.onBoardingData[2].description,
                    ),
                  ],
                ),
                //page dot indicators
                Container(
                  alignment: const Alignment(0, 0.7),
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 4,
                    effect: const ScrollingDotsEffect(
                      activeDotColor: kMainColor,
                      dotColor: kLightGrey,
                    ),
                  ),
                ),
                //Navigation button implimnetation
                Positioned(
                  bottom: 40,
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: !showDetails
                        ? GestureDetector(
                            onTap: () {
                              _controller.animateToPage(
                                _controller.page!.toInt() + 1,
                                duration: const Duration(microseconds: 400),
                                curve: Curves.easeInBack,
                              );
                            },
                            child: CustomButton(
                              buttonColor: kMainColor,
                              buttonText: showDetails ? 'Get Started' : 'Next',
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              //nabigate to the user data screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const UserDataScreen(),
                                ),
                              );
                            },
                            child: CustomButton(
                              buttonColor: kMainColor,
                              buttonText: showDetails ? 'Get Started' : 'Next',
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
