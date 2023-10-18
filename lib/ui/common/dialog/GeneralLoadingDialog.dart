import 'package:flutter/material.dart';

Widget GeneralLoadingDialog(String title, String btnText) {
  return Dialog(
      clipBehavior: Clip.antiAlias,
      insetPadding: EdgeInsets.all(32.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding: EdgeInsets.fromLTRB(32,32,32,16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              // style: primaryBigBoldTextStyle(),
            ),
            SizedBox(
              height: 16,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    // child: Lottie.asset('lib/assets/animation_loading.json', height: 120),
                  ),
                )
              ],
            ),
          ],
        ),
      ));
}
