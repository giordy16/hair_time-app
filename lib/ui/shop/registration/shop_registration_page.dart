import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hair_time/models/domain/shop/shop_model.dart';
import 'package:hair_time/ui/shop/registration/bloc/shop_registration_bloc.dart';
import 'package:hair_time/ui/shop/registration/bloc/shop_registration_event.dart';
import 'package:hair_time/ui/shop/registration/bloc/shop_registration_state.dart';

import '../../client/booking_flow/widgets/blue_button_with_card.dart';
import '../../client/booking_flow/widgets/booking_stepper.dart';
import '../../common/header/simple_header.dart';

class ShopRegistrationPage extends StatelessWidget {
  static const ROUTE = "/shopRegistrationPage";
  static const STEPS = 4;

  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ShopRegistrationBloc(
        ShopRegistrationState(shop: ShopModel.empty()),
      ),
      child: BlocBuilder<ShopRegistrationBloc, ShopRegistrationState>(builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            _handleBackClick(context);
            return false;
          },
          child: Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  SimpleHeader(onBackCallback: _handleBackClick),
                  BookingStepper(currentStep: state.currentPage, totalStep: STEPS),
                  Expanded(
                    child: PageView(
                      controller: _controller,
                      physics: NeverScrollableScrollPhysics(),
                      children: [],
                    ),
                  ),
                  BlueButtonWithCard(
                    text: "Avanti",
                    onClick: () {
                      onNextClick(state, context);
                    },
                    isEnabled: isButtonEnabled(state),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  bool isButtonEnabled(ShopRegistrationState state) {
    return false;
  }

  void _handleBackClick(BuildContext context) {
    if ((_controller.page ?? 0) > 0) {
      int pageToJump = (_controller.page ?? 0).toInt() - 1;
      context.read<ShopRegistrationBloc>().add(PageChangeEvent(pageToJump));
      _controller.animateToPage(pageToJump, duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
    } else {
      context.pop();
    }
  }

  void onNextClick(ShopRegistrationState state, BuildContext context) {
    int pageToJump = state.currentPage + 1;
    if (pageToJump + 1 > STEPS) return;
    context.read<ShopRegistrationBloc>().add(PageChangeEvent(pageToJump));
    _controller.animateToPage(pageToJump, duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
  }
}
