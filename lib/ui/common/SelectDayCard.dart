import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hair_time/enum/SelectableDayEnum.dart';
import 'package:hair_time/utils/CustomColors.dart';


class SelectDayCard extends StatefulWidget {
  final SelectableDayEnum item;
  final bool isSelected;
  final Function(SelectableDayEnum) callback;

  const SelectDayCard({Key? key, required this.item, required this.isSelected, required this.callback}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Card();
}

class _Card extends State<SelectDayCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.callback(widget.item);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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
            border: Border.all(color: CustomColors.primaryColor, width: 3, style: widget.isSelected ? BorderStyle.solid : BorderStyle.none),
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.item.value, style: TextStyle(color: CustomColors.primaryColor, fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
