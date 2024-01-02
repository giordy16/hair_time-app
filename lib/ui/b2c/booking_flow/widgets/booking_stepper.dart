import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hair_time/utils/custom_colors.dart';

class BookingStepper extends StatelessWidget {

  final int currentStep;
  final int totalStep;

  BookingStepper({required this.currentStep, required this.totalStep});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: generateList()
    );
  }

  List<Widget> generateList() {
    List<Widget> stepsList = [];

    for (int i = 0; i < totalStep; i++) {
      stepsList.add(
          Expanded(child: Container(
              height: 2,
              color: i <= currentStep ? CustomColors.primaryColor : null))
      );
    }

    return stepsList;
  }

}