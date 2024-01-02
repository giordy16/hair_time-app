import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hair_time/ui/b2c/shop/shop_detail_page.dart';
import 'package:hair_time/utils/constants.dart';
import 'package:hair_time/utils/custom_colors.dart';

import '../../../models/network/shop/ShopModel.dart';

class ShopListItem extends StatelessWidget {

  final ShopModel shopModel;

  ShopListItem({required this.shopModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(ShopDetailPage.ROUTE, extra: shopModel);
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
                        const SizedBox(
                          height: 4,
                        ),
                        Text(shopModel.phone),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text('Vedi gli orari'),
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}
