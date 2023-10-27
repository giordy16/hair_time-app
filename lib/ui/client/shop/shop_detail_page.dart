import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hair_time/ui/client/booking_flow/booking_flow_page.dart';
import 'package:hair_time/ui/common/buttons/blue_button_full_width.dart';
import 'package:hair_time/ui/common/header/simple_header.dart';
import 'package:hair_time/utils/constants.dart';
import 'package:hair_time/utils/custom_colors.dart';
import 'package:hair_time/utils/phone_helper.dart';

import '../../../models/network/shop/ShopModel.dart';

class ShopDetailPage extends StatelessWidget {
  static const ROUTE = "/shopDetail";

  const ShopDetailPage({required this.shop, super.key});

  final ShopModel shop;

  @override
  Widget build(BuildContext context) {
    PhoneHelper phoneHelper = PhoneHelper();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SimpleHeader(),
              Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                      height: 220,
                      width: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl: Constants.SHOP_IMAGE_LIST,
                        fit: BoxFit.fitWidth,
                      ))),
              Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16),
                  child: Text(
                    shop.name,
                    style: const TextStyle(color: CustomColors.primaryColor, fontSize: 24, fontWeight: FontWeight.bold),
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
                  child: Text(
                    shop.description,
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16),
                child: Row(
                  children: [
                    SvgPicture.asset("lib/assets/icon/location.svg", height: 20),
                    SizedBox(width: 4),
                    Text(shop.address),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16),
                  child: Row(
                    children: [
                      SvgPicture.asset("lib/assets/icon/phone.svg", height: 20),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          phoneHelper.openPhoneDealer(shop.phone);
                        },
                        child: Text(shop.phone),
                      )
                    ],
                  )),
              Container(
                margin: const EdgeInsets.only(top: 16, left: 16),
                padding: const EdgeInsets.only(bottom: 16, right: 24),
                decoration: const BoxDecoration(color: CustomColors.primaryColor, borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                        padding: EdgeInsets.only(top: 8, left: 16),
                        child: Text(
                          'ORARI',
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 8, left: 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 100,
                              child: Text(
                                'Lunedì',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Text(
                              '8:00 - 20:00',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 8, left: 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 100,
                              child: Text(
                                'Martedì',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Text(
                              '8:00 - 20:00',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 8, left: 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 100,
                              child: Text(
                                'Mercoledì',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Text(
                              '8:00 - 20:00',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 8, left: 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 100,
                              child: Text(
                                'Giovedì',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Text(
                              '8:00 - 20:00',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 8, left: 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 100,
                              child: Text(
                                'Venerdì',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Text(
                              '8:00 - 20:00',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 8, left: 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 100,
                              child: Text(
                                'Sabato',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Text(
                              '8:00 - 20:00',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 8, left: 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 100,
                              child: Text(
                                'Domenica',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Text(
                              '8:00 - 20:00',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )),
                  ],
                ),
              ),
              BlueButtonFullWidth(
                isEnabled: true,
                  text: 'Prenota un appuntamento',
                  onClick: () {
                    context.push(BookingFlowPage.ROUTE);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
