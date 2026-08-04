import 'package:flutter/material.dart';
import '../constant/colors.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/imges/logo.png', width: 100, fit: BoxFit.cover),
        const SizedBox(height: 12),
        const Text(
          'Expenz',
          style: TextStyle(
            fontSize: 50,
            color: kMainColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
