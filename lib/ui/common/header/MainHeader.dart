import 'package:flutter/material.dart';
import 'package:hair_time/utils/custom_colors.dart';

Widget MainHeader() {
  return Container(
    width: double.infinity,
    alignment: Alignment.center,
    decoration: BoxDecoration(color: CustomColors.primaryColor, borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
    child: const Padding(
      padding: EdgeInsets.fromLTRB(0, 48, 0, 8),
      child: Text(
        "Hair Time",
        style: TextStyle(fontFamily: "AnthonyHunter", fontSize: 32, color: Colors.white),
      ),
    ),
  );
}
