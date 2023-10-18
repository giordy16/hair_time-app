import 'package:flutter/material.dart';
import 'package:hair_time/ui/splash/SelectUserType.dart';
import 'package:hair_time/utils/CustomColors.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  static const SPLASH_DURATION_SECOND = 2;

  @override
  State<StatefulWidget> createState() => _Splash();
}

class _Splash extends State<Splash> {
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

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: Splash.SPLASH_DURATION_SECOND), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SelectUserType()));
    });

  }
}
