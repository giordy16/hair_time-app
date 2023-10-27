import 'package:flutter/material.dart';
import 'package:hair_time/models/domain/BookingDataModel.dart';
import 'package:hair_time/models/domain/BookingDayModel.dart';
import 'package:hair_time/utils/custom_colors.dart';

class BookingCardWidget extends StatelessWidget {
  final BookingDataModel model;
  final bool isSelected;
  final Function(BookingDataModel) callback;

  const BookingCardWidget({
    Key? key,
    required this.model,
    required this.isSelected,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callback(model);
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            color: CustomColors.backgroundLightGray,
            border: Border.all(color: CustomColors.primaryColor, width: 3, style: isSelected ? BorderStyle.solid : BorderStyle.none),
            borderRadius: BorderRadius.all(Radius.circular(24.0))),
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.name, style: TextStyle(color: CustomColors.primaryColor, fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}