import 'package:dp_expenz_application/constant/constatnt.dart';
import 'package:flutter/material.dart';

import '../../constant/colors.dart';

class AddNewScreen extends StatefulWidget {
  const AddNewScreen({super.key});

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  //state to track expence or income
  int _selectedMethod = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedMethod == 0 ? kRed : kGreen,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedMethod = 0;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: _selectedMethod == 0 ? kMainColor : kWhite,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 60,
                            ),
                            child: Text('Expences'),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedMethod = 1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: _selectedMethod == 1 ? kMainColor : kWhite,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 60,
                            ),
                            child: Text('Income'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Positioned(
            //   top: 300,
            //   left: 0,
            //   right: 0,
            //   bottom: 60,
            //   child: Container(
            //     width: double.infinity,
            //     height: 400,
            //     decoration: const BoxDecoration(
            //       borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(32),
            //         topRight: Radius.circular(32),
            //       ),
            //       color: kWhite,
            //     ),
            //     child: const Column(children: [Center(child: Text('data'))]),
            //   ),
            // ),
            // Positioned(
            //   top: 50,
            //   bottom: 900,
            //   left: 0,
            //   right: 0,
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 12),
            //     child: Container(
            //       decoration: BoxDecoration(
            //         color: kWhite,
            //         borderRadius: BorderRadius.circular(100),
            //       ),
            //       child: Padding(
            //         padding: const EdgeInsets.all(4.0),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceAround,
            //           children: [
            //             GestureDetector(
            //               onTap: () {
            //                 setState(() {
            //                   _selectedMethod = 0;
            //                 });
            //               },
            //               child: Container(
            //                 decoration: BoxDecoration(
            //                   color: kRed,
            //                   borderRadius: BorderRadius.circular(16),
            //                 ),
            //                 child: const Padding(
            //                   padding: EdgeInsets.symmetric(
            //                     vertical: 10,
            //                     horizontal: 60,
            //                   ),
            //                   child: Text('Expences'),
            //                 ),
            //               ),
            //             ),
            //             GestureDetector(
            //               onTap: () {
            //                 setState(() {
            //                   _selectedMethod = 1;
            //                 });
            //               },
            //               child: Container(
            //                 decoration: BoxDecoration(
            //                   color: kRed,
            //                   borderRadius: BorderRadius.circular(16),
            //                 ),
            //                 child: const Padding(
            //                   padding: EdgeInsets.symmetric(
            //                     vertical: 10,
            //                     horizontal: 60,
            //                   ),
            //                   child: Text('Income'),
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
