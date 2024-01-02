import 'package:flutter/material.dart';

import '../../../../utils/custom_colors.dart';
import '../../../common/buttons/blue_button_full_width.dart';

class BlueButtonWithCard extends StatelessWidget {
  final String text;
  final Function() onClick;
  final bool isEnabled;

  BlueButtonWithCard({required this.text, required this.onClick, this.isEnabled = false});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 7,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Card(
          color: CustomColors.backgroundLightGray,
          margin: EdgeInsets.zero,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: BlueButtonFullWidth(text: text, onClick: onClick, isEnabled: isEnabled),
        ),
      );
  }
}
