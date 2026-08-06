import 'package:dp_expenz_application/screens/main_screen.dart';
import 'package:dp_expenz_application/screens/on_board_screen.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  final bool showMainScreenAccriginToTheOutput;
  const Wrapper({super.key, required this.showMainScreenAccriginToTheOutput});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return widget.showMainScreenAccriginToTheOutput ? const MainScreen() 
    : const OnBoardScreen();
  }
}
