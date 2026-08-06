import 'package:flutter/material.dart';

import '../constant/colors.dart';

class ReusbleHomePageCard extends StatefulWidget {
  final String mainTitle;
  final String subTitelPrice;
  final String imgUrl;
  final Color containerColr;
  const ReusbleHomePageCard({
    super.key,
    required this.mainTitle,
    required this.subTitelPrice,
    required this.imgUrl,
    required this.containerColr,
  });

  @override
  State<ReusbleHomePageCard> createState() => _ReusbleHomePageCardState();
}

class _ReusbleHomePageCardState extends State<ReusbleHomePageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 90,
      decoration: BoxDecoration(
        color: widget.containerColr,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset(widget.imgUrl, fit: BoxFit.cover, width: 40),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.mainTitle,
                  style: const TextStyle(
                    color: kWhite,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "\$${widget.subTitelPrice}",
                  style: const TextStyle(
                    color: kWhite,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
