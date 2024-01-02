import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_text_field.dart';

class AppTextFieldWithLabel extends StatelessWidget {
  String hint;
  String topLabel;
  TextEditingController controller;

  AppTextFieldWithLabel({required this.hint, required this.controller, this.topLabel = ""});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (topLabel.isNotEmpty) ...[
          Text(
            topLabel,
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 16),
        ],
        AppTextField(
          hint: hint,
          controller: controller,
        ),
      ],
    );
  }
}
