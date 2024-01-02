import 'package:flutter/material.dart';
import 'package:hair_time/utils/custom_colors.dart';

class AppTextField extends StatelessWidget {
  String hint;
  TextEditingController controller;
  TextInputType inputType;

  AppTextField({
    required this.hint,
    required this.controller,
    this.inputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        decoration: InputDecoration(
            label: Text(hint),
            border: const OutlineInputBorder(
                borderSide: BorderSide(
              color: CustomColors.lightGray,
              width: 4,
            ))),
        textCapitalization: TextCapitalization.sentences,
        keyboardType: inputType);
  }
}
