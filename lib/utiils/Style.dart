import 'package:flutter/material.dart';

import 'CustomColors.dart';

ButtonStyle RoundedCustomColorButton(Color color) {
  return ButtonStyle(
      padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0)),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      backgroundColor: MaterialStateProperty.all<Color>(color),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0), side: BorderSide(color: CustomColors.primaryColor))));
}

ButtonStyle BlueBtnWithLogic(bool enabled) {
  return ButtonStyle(
      padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0)),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      backgroundColor: MaterialStateProperty.all<Color>(enabled ? CustomColors.primaryColor : CustomColors.primaryColor.withOpacity(0.5)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0), side: BorderSide(color: CustomColors.primaryColor))));
}
