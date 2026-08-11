import 'package:dp_expenz_application/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/expence_model.dart';

class ExpencesCard extends StatelessWidget {
  final double amount;
  final String mainTitle;
  final String subtitle;
  final DateTime createdAt;
  final ExpenceCateraries expencesCategaory;

  const ExpencesCard({
    super.key,
    required this.amount,
    required this.mainTitle,
    required this.subtitle,
    required this.createdAt,
    required this.expencesCategaory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: kGrey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: expencesCategariesColors[expencesCategaory],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  expencesImages[expencesCategaory]!,
                  width: 50,
                  height: 50,
                  // fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 100,
                  child: Text(
                    mainTitle,
                    style: const TextStyle(
                      fontSize: 16,
                      color: kBlack,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                SizedBox(
                  width: 150,
                  child: Text(
                    subtitle,
                    style: const TextStyle(color: kGrey),

                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100,
                  child: Text(
                    "-\$${amount.toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 14, color: kRed),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                Text(
                  DateFormat.jm().format(createdAt),
                  style: const TextStyle(color: kGrey, fontSize: 11),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
