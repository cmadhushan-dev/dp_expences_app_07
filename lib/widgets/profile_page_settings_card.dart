import 'package:dp_expenz_application/constant/colors.dart';
import 'package:flutter/material.dart';

class ProfilePageSettingsCard extends StatelessWidget {
  final String tileTitle;
  final IconData iconName;
  final Color conarinerColor;
  final Color iconColor;
  const ProfilePageSettingsCard({
    super.key,
    required this.tileTitle,
    required this.iconName,
    required this.conarinerColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(10),
      height: 90,
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: kGrey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 12,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: conarinerColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(iconName, color: iconColor, size: 30),
          ),
          const SizedBox(width: 12),
          Text(
            tileTitle,
            style: const TextStyle(
              fontSize: 18,
              color: kBlack,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
