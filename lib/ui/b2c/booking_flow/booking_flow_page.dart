import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hair_time/models/domain/client_booking/BookingDayModel.dart';
import 'package:hair_time/models/domain/client_booking/BookingTimeModel.dart';
import 'package:hair_time/ui/b2c/booking_flow/bloc/booking_flow_bloc.dart';
import 'package:hair_time/ui/b2c/booking_flow/booking_step_1_day.dart';
import 'package:hair_time/ui/b2c/booking_flow/booking_step_2_time.dart';
import 'package:hair_time/ui/b2c/booking_flow/booking_step_3_service.dart';
import 'package:hair_time/ui/b2c/booking_flow/enum/sex_enum.dart';
import 'package:hair_time/ui/b2c/booking_flow/widgets/booking_stepper.dart';
import 'package:hair_time/ui/b2c/booking_flow/widgets/blue_button_with_card.dart';
import 'package:hair_time/ui/common/header/simple_header.dart';

import '../../../models/domain/client_booking/BookingServiceModel.dart';

class BookingFlowPage extends StatelessWidget {
  static const ROUTE = "/clientBookingFlow";
  static const STEPS = 3;

  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookingFlowBloc(
        BookingFlowState(
          daysList: [
            BookingDayModel(0, "Prima possibile", false),
            BookingDayModel(1, "Tra lunedì e venerdì", false),
            BookingDayModel(2, "Weekend", false),
            BookingDayModel(3, "Seleziona data", true),
          ],
          timesList: [
            BookingTimeModel(0, "Mattina"),
            BookingTimeModel(1, "Pomeriggio"),
            BookingTimeModel(2, "Dopo le 18"),
            BookingTimeModel(3, "Nessuna preferenza"),
          ],
          serviceList: [
            BookingServiceModel(0, "Taglio capelli", Sex.MAN),
            BookingServiceModel(1, "Taglio barba", Sex.MAN),
            BookingServiceModel(2, "Taglio barba e capelli", Sex.MAN),
            BookingServiceModel(3, "Lavaggio capelli", Sex.MAN),
            BookingServiceModel(3, "Lavaggio capelli", Sex.MAN),
            BookingServiceModel(3, "Lavaggio capelli", Sex.MAN),
            BookingServiceModel(3, "Lavaggio capelli", Sex.MAN),
            BookingServiceModel(3, "Lavaggio capelli", Sex.MAN),
            BookingServiceModel(4, "Taglio capelli", Sex.WOMAN),
            BookingServiceModel(5, "Tinta", Sex.WOMAN),
            BookingServiceModel(6, "Taglio baffi", Sex.WOMAN),
          ]
        ),
      ),
      child: BlocBuilder<BookingFlowBloc, BookingFlowState>(builder: (context, state) {
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
                      children: [
                    BookingStepOneDay(state),
                    BookingStepTwoTime(state),
                    BookingStepThreeRecap(state),
                      ],
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
      context.read<BookingFlowBloc>().add(PageChangeEvent(pageToJump));
      _controller.animateToPage(pageToJump, duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
    } else {
      context.pop();
    }
  }

  void onNextClick(BookingFlowState state, BuildContext context) {
    int pageToJump = state.currentPage + 1;
    if (pageToJump + 1 > STEPS) return;
    context.read<BookingFlowBloc>().add(PageChangeEvent(pageToJump));
    _controller.animateToPage(pageToJump, duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
  }
}
