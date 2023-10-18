import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hair_time/network/model/ShopModel.dart';
import 'package:hair_time/ui/client/booking/StateDay.dart';
import 'package:hair_time/ui/common/header/SimpleHeader.dart';
import 'package:hair_time/utils/Constants.dart';
import 'package:hair_time/utils/CustomColors.dart';
import 'package:hair_time/utils/PhoneHelper.dart';
import 'package:hair_time/utils/Style.dart';

class ShopDetail extends StatefulWidget {
  const ShopDetail(this.shop, {Key? key}) : super(key: key);
  final ShopModel shop;

  @override
  State<StatefulWidget> createState() => _ShopDetail();
}

class _ShopDetail extends State<ShopDetail> {

  PhoneHelper phoneHelper = PhoneHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SimpleHeader(context, true),
              Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Container(
                      height: 220,
                      width: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl: Constants.SHOP_IMAGE_LIST,
                        fit: BoxFit.fitWidth,
                      ))),
              Padding(
                  padding: EdgeInsets.only(top: 16, left: 16),
                  child: Text(
                    widget.shop.name,
                    style: TextStyle(color: CustomColors.primaryColor, fontSize: 24, fontWeight: FontWeight.bold),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                  child: Text(
                    widget.shop.description,
                  )),
              Padding(
                padding: EdgeInsets.only(top: 16, left: 16),
                child: Row(
                  children: [SvgPicture.asset("lib/assets/icon/location.svg", height: 20), SizedBox(width: 5), Text(widget.shop.address)],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 16, left: 16),
                  child: Row(
                    children: [
                      SvgPicture.asset("lib/assets/icon/phone.svg", height: 20),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: (){
                          phoneHelper.openPhoneDealer(widget.shop.phone);
                        },
                        child: Text(widget.shop.phone),
                      )
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(top: 16, left: 16),
                padding: EdgeInsets.only(bottom: 16, right: 24),
                decoration: BoxDecoration(color: CustomColors.primaryColor, borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
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
              Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: ElevatedButton(
                    style: BlueBtnWithLogic(true),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => StateDay()));
                    },
                    child: Text('SCOPRI I SERVIZI'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
