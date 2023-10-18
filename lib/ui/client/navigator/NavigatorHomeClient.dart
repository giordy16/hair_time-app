import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hair_time/utils/CustomColors.dart';

import '../bookingHistory/BookingHistory.dart';
import '../home/ShopList.dart';

class NavigatorHomeClient extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Navigator();
}

class _Navigator extends State<NavigatorHomeClient> {
  int pageIndex = 0;

  final pages = [ShopList(), BookingHistory()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: pages[pageIndex], bottomNavigationBar: buildBottomBar());
  }

  Widget buildBottomBar() {
    EdgeInsets padding = MediaQuery.of(context).viewPadding;

    double bPadding = 0.0;
    if (padding.bottom == 0 || Platform.isIOS) bPadding = 8.0;

    return SafeArea(
        child: Container(
      padding: EdgeInsets.fromLTRB(0, 8, 0, bPadding),
      decoration: BoxDecoration(color: CustomColors.primaryColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              pageIndex = 0;
              setState(() {});
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.store, color: Colors.white),
                Text(
                  "Vicino a te",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 8,
                ),
                whiteDot(0)
              ],
            ),
          ),
          GestureDetector(
              onTap: () {
                pageIndex = 1;
                setState(() {});
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.list_alt, color: Colors.white),
                  Text("Le tue prenotazioni", style: TextStyle(color: Colors.white)),
                  SizedBox(
                    height: 8,
                  ),
                  whiteDot(1)
                ],
              ))
        ],
      ),
    ));
  }

  Widget whiteDot(int index) {
    return Container(
      width: 4,
      height: 4,
      child: Visibility(
        visible: pageIndex == index,
        child: Container(
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        ),
      ),
    );
  }
}
