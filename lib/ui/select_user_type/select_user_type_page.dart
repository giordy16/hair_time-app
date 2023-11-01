import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hair_time/ui/common/header/simple_header.dart';
import 'package:hair_time/ui/select_user_type/bloc/select_user_type_bloc.dart';
import 'package:hair_time/ui/select_user_type/select_user_card.dart';
import 'package:hair_time/ui/select_user_type/select_user_type_enum.dart';
import 'package:hair_time/ui/shop/registration/bloc/shop_registration_state.dart';
import 'package:hair_time/ui/shop/registration/shop_registration_page.dart';
import 'package:hair_time/utils/styles/button_styles.dart';

import '../client/shop_list/shop_list_page.dart';

class SelectUserType extends StatelessWidget {
  const SelectUserType({Key? key}) : super(key: key);

  static const String ROUTE = '/selectUserType';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SelectUserTypeBloc(Idle()),
      child: Scaffold(
        body: BlocBuilder<SelectUserTypeBloc, SelectUserTypeState>(builder: (context, state) {
          state as Idle;

          return SafeArea(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SimpleHeader(showBack: false),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectUserCard(
                        type: UserTypeEnum.SHOP,
                        isSelected: (state).selectedUserType == UserTypeEnum.SHOP,
                        callback: (UserTypeEnum userTypeEnum) {
                          handleClick(context, userTypeEnum);
                        }),
                    SelectUserCard(
                        type: UserTypeEnum.CLIENT,
                        isSelected: (state).selectedUserType == UserTypeEnum.CLIENT,
                        callback: (UserTypeEnum userTypeEnum) {
                          handleClick(context, userTypeEnum);
                        }),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 32),
                  child: ElevatedButton(
                    style: BlueBtn(false),
                    onPressed: () {
                      state.selectedUserType == UserTypeEnum.CLIENT ?
                      context.go(ShopList.ROUTE) :
                      context.go(ShopRegistrationPage.ROUTE);
                    },
                    child: Text('AVANTI'),
                  ),
                ),
              ),
            ],
          ));
        }),
      ),
    );
  }

  void handleClick(BuildContext context, UserTypeEnum userTypeEnum) {
    context.read<SelectUserTypeBloc>().add(UserSelectedEvent(userTypeEnum));
  }
}
