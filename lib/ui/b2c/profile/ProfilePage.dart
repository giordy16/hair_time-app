import 'package:flutter/material.dart';
import 'package:hair_time/ui/common/list/generic_card_data.dart';
import 'package:hair_time/ui/common/list/generic_card_list.dart';
import 'package:hair_time/utils/custom_colors.dart';

class ProfilePage extends StatelessWidget {
  static const ROUTE = "/profilePage";
  static const CARD_DIAMETER = 80.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Card(
                    margin: EdgeInsets.zero,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(CARD_DIAMETER / 2),
                    ),
                    color: CustomColors.primaryColor,
                    child: Container(
                      width: CARD_DIAMETER,
                      height: CARD_DIAMETER,
                      alignment: Alignment.center,
                      child: Text(
                        "M",
                        style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text("Mario Draghi", style: TextStyle(fontSize: 16))
                ],
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(16),
              child: GenericCardList(
                [
                  GenericCardData("", "Le mie prenotazioni", () {}),
                  GenericCardData("", "Test", () {}),
                  GenericCardData("", "Test", () {}),
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}
