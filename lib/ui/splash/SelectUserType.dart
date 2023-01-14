import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hair_time/widget/header/MainHeader.dart';
import 'package:hair_time/widget/header/SimpleHeader.dart';

import '../../utiils/Style.dart';
import '../../widget/SelectUserCard.dart';
import '../client/navigator/NavigatorHomeClient.dart';

class SelectUserType extends StatefulWidget {
  const SelectUserType({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SelectUserType();
}

class _SelectUserType extends State<SelectUserType> {
  final storage = FlutterSecureStorage();

  String selectedCardTitle = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SimpleHeader(context, false),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SelectUserCard(
                    title: 'ESERCENTE',
                    message: 'Sei un parrucchiere/barbiere e vuoi semplificare le prenotazioni per la tua attività',
                    isSelected: selectedCardTitle == 'ESERCENTE',
                    callback: handleClick),
                SelectUserCard(
                    title: 'CLIENTE',
                    message: 'Vuoi trovare il parrucchiere/barbiere più vicino a te e prenotare con pochi click',
                    isSelected: selectedCardTitle == 'CLIENTE',
                    callback: handleClick)
              ],
            ),
          ),
          Container(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 32),
              child: ElevatedButton(
                style: BlueBtnWithLogic(selectedCardTitle.isNotEmpty),
                onPressed: () {
                  if (selectedCardTitle.isNotEmpty) {
                    if (selectedCardTitle == 'CLIENTE') {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => NavigatorHomeClient()));
                    } else {}
                  }
                },
                child: Text('AVANTI'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  handleClick(String str) {
    selectedCardTitle = str;
    setState(() {});
  }

  void goToHome() {
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const NavigationHome()));
  }
}
