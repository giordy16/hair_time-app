import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hair_time/ui/select_user_type/select_user_type_page.dart';
import 'package:hair_time/utils/custom_colors.dart';
import 'package:hair_time/utils/dimemsions.dart';
import 'package:hair_time/utils/styles/text_styles.dart';

import '../../app/app_language.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  static const String ROUTE = '/';
  static const int SPLASH_DURATION_SECOND = 2;

  @override
  Widget build(BuildContext context) {

    _startSplashCountdown(context);
    _initApp(context);

    return Scaffold(
      backgroundColor: CustomColors.primaryColor,
      body: Align(
        alignment: Alignment.center,
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("lib/assets/app_icon.png", width: 120),
            const SizedBox(height: Dimensions.m),
            Text("Hair Time", style: TextStyles.hairTimeTextStyle())
          ],
        ),
      ),
    );
  }

  void _startSplashCountdown(BuildContext context) {
    Future.delayed(const Duration(seconds: SplashPage.SPLASH_DURATION_SECOND), () {
      context.go(SelectUserType.ROUTE);
    });
  }


  void _initApp(BuildContext context) {
    languageCode = Localizations.localeOf(context).languageCode;
  }

}
