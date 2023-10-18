import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hair_time/network/model/ShopModel.dart';
import 'package:hair_time/ui/client/shop/ShopDetail.dart';
import 'package:hair_time/utils/Constants.dart';
import 'package:hair_time/utils/CustomColors.dart';

Widget ShopListItem(
    BuildContext context,
    ShopModel shopModel
    ) {
  return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => ShopDetail(shopModel)));
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
                    children: [
                      Text(
                        shopModel.name,
                        style: TextStyle(color: CustomColors.primaryColor, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(shopModel.address),
                      SizedBox(
                        height: 4,
                      ),
                      Text(shopModel.phone),
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
