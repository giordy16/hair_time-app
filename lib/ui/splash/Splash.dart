// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hair_time/utiils/CustomColors.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  static const SPLASH_DURATION_SECOND = 2;

  @override
  State<StatefulWidget> createState() => _Splash();
}

class _Splash extends State<Splash> {
  final storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primaryColor,
      body: Align(
        alignment: Alignment.center,
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("lib/assets/app_icon.png", width: 120),
            SizedBox(height: 16,),
            Text("Hair Time", style: TextStyle(fontFamily: "AnthonyHunter", fontSize: 32, color: Colors.white),)
          ],
        ),
      ),
    );
  }

  void goToHome() {
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const NavigationHome()));
  }

  /**
   *
   *  Dato che FlutterSecureStorage salva la informazioni sulla keyChain,
   *  anche se l'app viene disinstallata le informazioni rimangono salvate sul telefono,
   *  quindi al primo avvio dell'app è meglio eliminarle
   *
   */
  void clearKeyChain() {
    storage.deleteAll();
  }
}
