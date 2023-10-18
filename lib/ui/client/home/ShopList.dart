import 'package:flutter/material.dart';
import 'package:hair_time/ui/common/ShopListItem.dart';
import '../../../network/model/ShopModel.dart';
import '../../common/header/SimpleHeader.dart';

class ShopList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ShopList();
}

class _ShopList extends State<ShopList> with AutomaticKeepAliveClientMixin<ShopList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SimpleHeader(context, false),
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
                              ShopListItem(context, ShopModel.getTestModel()),
                              ShopListItem(context, ShopModel.getTestModel()),
                              ShopListItem(context, ShopModel.getTestModel()),
                              ShopListItem(context, ShopModel.getTestModel()),
                              ShopListItem(context, ShopModel.getTestModel()),
                              ShopListItem(context, ShopModel.getTestModel()),
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

  @override
  bool get wantKeepAlive => true;
}
