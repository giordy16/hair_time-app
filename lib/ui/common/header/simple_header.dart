import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hair_time/utils/custom_colors.dart';
import 'package:hair_time/utils/styles/text_styles.dart';

class SimpleHeader extends StatelessWidget {

  bool showBack;

  SimpleHeader({this.showBack = true});

  @override
  Widget build(BuildContext context) {
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
                style: TextStyles.hairTimeTextStyle().copyWith(color: CustomColors.primaryColor),
              )),
          Visibility(
              visible: showBack,
              child: GestureDetector(
                child: Container(
                  child: Icon(Icons.arrow_back_ios_new, color: CustomColors.primaryColor),
                  height: 50,
                ),
                onTap: () {
                  context.pop();
                },
              )),
        ],
      ),
    );
  }
}