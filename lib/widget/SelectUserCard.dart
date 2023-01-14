import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utiils/CustomColors.dart';

class SelectUserCard extends StatefulWidget {
  final String title;
  final String message;
  final bool isSelected;
  final Function(String) callback;

  const SelectUserCard({Key? key, required this.title, required this.message, required this.isSelected, required this.callback}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Card();
}

class _Card extends State<SelectUserCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.callback(widget.title);
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
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
              Text(widget.title, style: TextStyle(color: CustomColors.primaryColor, fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 16,
              ),
              Text(widget.message),
            ],
          ),
        ),
      ),
    );
  }
}
