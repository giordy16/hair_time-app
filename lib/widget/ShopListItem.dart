import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hair_time/utiils/Constants.dart';
import 'package:hair_time/utiils/CustomColors.dart';

Widget ShopListItem(
    // String image,
    // String name,
    // String address,
    // String phone
    ) {
  return GestureDetector(
    onTap: (){

    },
    child: Card(
        margin: EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Container(
                height: 100,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  child: CachedNetworkImage(
                    imageUrl: Constants.SHOP_IMAGE_LIST,
                    fit: BoxFit.fitWidth,
                  ),
                )),
            Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'BARBIERE DA GIGI',
                        style: TextStyle(color: CustomColors.primaryColor, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text('Via Roma 4, Treviso (TV)'),
                      SizedBox(
                        height: 4,
                      ),
                      Text('0422400600'),
                      SizedBox(
                        height: 4,
                      ),
                      Text('Vedi gli orari'),
                    ],
                  ),
                ))
          ],
        )),
  );
}
