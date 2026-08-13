import 'package:dp_expenz_application/constant/colors.dart';
import 'package:dp_expenz_application/constant/constatnt.dart';
import 'package:flutter/material.dart';

class CategaryCards extends StatefulWidget {
  final String title;
  final double amount;
  final double total;
  final Color progrossColor;
  final bool isexpence;

  const CategaryCards({
    super.key,
    required this.title,
    required this.amount,
    required this.total,
    required this.progrossColor,
    required this.isexpence,
  });

  @override
  State<CategaryCards> createState() => _CategaryCardsState();
}

class _CategaryCardsState extends State<CategaryCards> {
  @override
  Widget build(BuildContext context) {
    double progressWidth = widget.total != 0
        ? MediaQuery.of(context).size.width * (widget.amount / widget.total)
        : 0;

    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(kDefaulPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kWhite,
        boxShadow: [BoxShadow(color: kBlack.withOpacity(0.1), blurRadius: 20)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: widget.progrossColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: kBlack,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "${(widget.amount / widget.total * 100).toStringAsFixed(2)}%",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: kBlack,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                '${widget.amount.toStringAsFixed(2)} \$',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: widget.isexpence ? kRed : kGreen,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          //linear prgrasee bar
          Container(
            height: 10,
            width: progressWidth,
            decoration: BoxDecoration(
              color: widget.progrossColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
