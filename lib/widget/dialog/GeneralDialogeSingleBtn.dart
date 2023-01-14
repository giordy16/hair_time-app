import 'package:flutter/material.dart';

import '../../utiils/CustomColors.dart';
import '../../utiils/Style.dart';

Widget GeneralDialogeSingleBtn(String title, String message, String btnText, VoidCallback btnCallback) {
  return Expanded(
      child: Dialog(
          clipBehavior: Clip.antiAlias,
          insetPadding: EdgeInsets.all(32.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Padding(
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title.toUpperCase(),
                  textAlign: TextAlign.center,
                    style: TextStyle(color: CustomColors.primaryColor, fontSize: 20, fontWeight: FontWeight.bold)
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  message,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      btnCallback();
                    },
                    style: RoundedCustomColorButton(CustomColors.primaryColor),
                    child: Text(btnText.toUpperCase()),
                  ),
                )
              ],
            ),
          )));
}
