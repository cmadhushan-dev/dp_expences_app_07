import 'package:dp_expenz_application/constant/colors.dart';
import 'package:flutter/material.dart';

class UserDataInputBox extends StatefulWidget {
  final String fieldName;
  final TextEditingController usedDataController;

  const UserDataInputBox({super.key, required this.fieldName, required this.usedDataController});

  @override
  State<UserDataInputBox> createState() => _UserDataInputBoxState();
}

class _UserDataInputBoxState extends State<UserDataInputBox> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.usedDataController,
      decoration: InputDecoration(
        fillColor: kWhite.withOpacity(0.2),
        filled: true,
        hintText: widget.fieldName,
        hintStyle: const TextStyle(
          fontSize: 14,
          color: kGrey,
          fontWeight: FontWeight.w600,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: kWhite, width: 2),
        ),
        contentPadding: const EdgeInsets.all(16),
      ),
    );
  }
}
