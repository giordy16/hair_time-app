import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hair_time/models/domain/BookingDayModel.dart';
import 'package:hair_time/models/domain/BookingTimeModel.dart';
import 'package:hair_time/ui/client/booking_flow/bloc/booking_flow_bloc.dart';
import 'package:hair_time/ui/client/booking_flow/booking_step_1_day.dart';
import 'package:hair_time/ui/client/booking_flow/booking_step_2_time.dart';
import 'package:hair_time/ui/client/booking_flow/widgets/blue_button_with_card.dart';
import 'package:hair_time/ui/common/header/simple_header.dart';

class BookingFlowPage extends StatelessWidget {
  static const ROUTE = "/clientBookingFlow";

  final  _controller = PageController();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (_) => BookingFlowBloc(
        BookingFlowState(daysList: [
          BookingDayModel(0, "Prima possibile"),
          BookingDayModel(1, "Tra lunedì e venerdì"),
          BookingDayModel(2, "Weekend"),
        ],
        timesList: [
          BookingTimeModel(0, "Mattina"),
          BookingTimeModel(1, "Pomeriggio"),
          BookingTimeModel(2, "Dopo le 18"),
          BookingTimeModel(3, "Nessuna preferenza"),
        ]),
      ),
      child: BlocBuilder<BookingFlowBloc, BookingFlowState>(builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  SimpleHeader(onBackCallback: _handleBackClick),
                  Expanded(
                      child: PageView(
                    controller: _controller,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      BookingStepOneDay(state),
                      BookingStepTwoTime(state),
                    ],
                  )),
                  BlueButtonWithCard(
                    text: "Avanti",
                    onClick: () {
                      int pageToJump = state.currentPage + 1;
                      context.read<BookingFlowBloc>().add(PageChangeEvent(pageToJump));
                      _controller.animateToPage(pageToJump, duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
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

  bool isButtonEnabled(BookingFlowState state) {
    if (state.currentPage == 0) {
      return state.daySelected != null;
    } else if (state.currentPage == 1) {
      return state.timeSelected != null;
    }
    return false;
  }

  void _handleBackClick(BuildContext context) {
    if ((_controller.page ?? 0) > 0) {
      int pageToJump = (_controller.page ?? 0).toInt() - 1;
      _controller.animateToPage(pageToJump, duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
    } else {
      context.pop();
    }
  }

}
