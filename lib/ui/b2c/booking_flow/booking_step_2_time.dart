import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hair_time/models/domain/client_booking/BookingDataModel.dart';
import 'package:hair_time/models/domain/client_booking/BookingTimeModel.dart';
import 'package:hair_time/ui/b2c/booking_flow/bloc/booking_flow_bloc.dart';
import 'package:hair_time/ui/b2c/booking_flow/widgets/booking_card_widget.dart';
import 'package:hair_time/utils/custom_colors.dart';

class BookingStepTwoTime extends StatelessWidget {
  BookingFlowState state;

  BookingStepTwoTime(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Prenota il tuo appuntamento',
            style: TextStyle(fontSize: 24, color: CustomColors.primaryColor, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Quando?',
            style: TextStyle(fontSize: 18),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Seleziona la fascia oraria a te più comoda.',
            style: TextStyle(fontSize: 14),
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.timesList?.length ?? 0,
              itemBuilder: (context, index) {
                return BookingCardWidget(
                  model: state.timesList![index],
                  isSelected: state.timeSelected == state.timesList![index],
                  callback: (BookingDataModel time) {
                    context.read<BookingFlowBloc>().add(TimeSelectedEvent(time as BookingTimeModel));
                  },
                );
              }),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}