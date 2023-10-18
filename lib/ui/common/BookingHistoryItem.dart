import 'package:flutter/material.dart';
import 'package:hair_time/utils/CustomColors.dart';

Widget BookingHistoryItem() {
  return GestureDetector(
    onTap: () {},
    child: Card(
        margin: EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text('24', style: TextStyle(color: CustomColors.primaryColor, fontSize: 22, fontWeight: FontWeight.bold),),
                    Text('SET', style: TextStyle(color: CustomColors.primaryColor, fontSize: 18, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0,16,16,16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('BARBIERE DA GIGI', style: TextStyle(color: CustomColors.primaryColor, fontWeight: FontWeight.bold),),
                    Text('24 Settembere - 14:30'),
                    SizedBox(height: 8,),
                    Text('Taglio di capelli uomo'),
                  ],
                ),
              ),
            ),
          ],
        )),
  );
}
