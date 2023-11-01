import 'package:flutter/material.dart';
import 'package:hair_time/ui/client/shop_list/shop_list_widget.dart';

import '../../../models/network/shop/ShopModel.dart';
import '../../common/header/simple_header.dart';

class ShopList extends StatelessWidget {
  static const ROUTE = '/ShopList';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SimpleHeader(showBack: false),
              Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: Text(
                              'Seleziona un parrucchiere per effettuare una prenotazione',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 16),
                              child: Column(
                                children: [
                                  ShopListItem(shopModel: ShopModel.getTestModel()),
                                  ShopListItem(shopModel: ShopModel.getTestModel()),
                                  ShopListItem(shopModel: ShopModel.getTestModel()),
                                ],
                              ))
                        ],
                      ),
                    )),
              )
            ],
          ),
        ));
  }
}