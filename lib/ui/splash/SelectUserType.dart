import 'package:flutter/material.dart';
import 'package:hair_time/ui/client/navigator/NavigatorHomeClient.dart';
import 'package:hair_time/ui/common/header/SimpleHeader.dart';
import 'package:hair_time/utils/Style.dart';
import 'package:hair_time/ui/common/SelectUserCard.dart';

class SelectUserType extends StatefulWidget {
  const SelectUserType({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SelectUserType();
}

class _SelectUserType extends State<SelectUserType> {
  String selectedCardTitle = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisSize: MainAxisSize.min,
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
      )),
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
