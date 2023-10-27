import 'package:flutter/material.dart';

import '../../../utils/custom_colors.dart';

class BlueButtonFullWidth extends StatelessWidget {
  final bool isEnabled;
  final String text;
  final Function() onClick;

  const BlueButtonFullWidth({
    super.key,
    this.isEnabled = true,
    required this.text,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: ElevatedButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(isEnabled ? CustomColors.primaryColor : CustomColors.primaryColor.withOpacity(0.5)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
                side: BorderSide(color: isEnabled ? CustomColors.primaryColor : CustomColors.backgroundLightGray),
              ))),
          onPressed: isEnabled ? onClick : null,
          child: Text(text.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
