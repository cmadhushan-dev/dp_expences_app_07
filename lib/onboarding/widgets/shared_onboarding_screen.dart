import 'package:dp_expenz_application/constant/colors.dart';
import 'package:dp_expenz_application/constant/constatnt.dart';
import 'package:flutter/material.dart';

class SharedOnboardingScreen extends StatelessWidget {
  final String imagesUrl;
  final String mainTitle;
  final String description;
  const SharedOnboardingScreen({
    super.key,
    required this.imagesUrl,
    required this.mainTitle,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaulPadding,
        vertical: kDefaulPadding,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagesUrl, width: 300, fit: BoxFit.cover),
          const SizedBox(height: 6),
          SizedBox(
            width: 300,
            height: 80,
            child: Text(
              mainTitle,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: kBlack,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: 300,
            height: 100,
            child: Text(
              description,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: kGrey,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
