import 'package:flutter/material.dart';
import 'package:hair_time/utils/CustomColors.dart';

Widget SimpleHeader(BuildContext context, bool showBack) {
  EdgeInsets padding = MediaQuery.of(context).viewPadding;

  return Padding(
    padding: EdgeInsets.fromLTRB(16, 0, 8, 0),
    child: Stack(
      children: [
        Container(
            height: 50,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              "Hair Time",
              style: TextStyle(fontFamily: "AnthonyHunter", fontSize: 32, color: CustomColors.primaryColor),
            )),
        Visibility(
            visible: showBack,
            child: GestureDetector(
              child: Container(
                child: Icon(Icons.arrow_back_ios_new, color: CustomColors.primaryColor),
                height: 50,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            )),
      ],
    ),
  );
}
