import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hair_time/ui/client/booking_flow/bloc/booking_flow_bloc.dart';
import 'package:hair_time/ui/client/booking_flow/widgets/booking_card_widget.dart';
import 'package:hair_time/utils/custom_colors.dart';

import '../../../models/domain/client_booking/BookingDataModel.dart';
import '../../../models/domain/client_booking/BookingDayModel.dart';

class BookingStepOneDay extends StatelessWidget {
  BookingFlowState state;

  BookingStepOneDay(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Prenota il tuo appuntamento',
            style: TextStyle(fontSize: 24, color: CustomColors.primaryColor, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Quando?',
            style: TextStyle(fontSize: 18),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Seleziona quando vorresti avere il tuo appuntamento.\nSuccessivamente potrai selezionare la fascia oraria.',
            style: TextStyle(fontSize: 14),
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.daysList?.length ?? 0,
              itemBuilder: (context, index) {
                return BookingCardWidget(
                  model: state.daysList![index],
                  isSelected: state.daySelected == state.daysList![index],
                  callback: (BookingDataModel day) {
                    day as BookingDayModel;
                    if (day.openCalendar) {
                      _openCalendar(context, day);
                    } else {
                      context.read<BookingFlowBloc>().add(DaySelectedEvent(day));
                    }
                  },
                );
              }),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  // todo le date selezionabili dovrebbero adattarsi il base allo store, ora si possono selezionare tutti i giorni
  Future<void> _openCalendar(BuildContext context, BookingDayModel day) async {

    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        locale: Localizations.localeOf(context),
        lastDate: DateTime.utc(DateTime.now().year + 1),
        selectableDayPredicate: (DateTime val) => val.weekday == DateTime.saturday || val.weekday == DateTime.sunday ? false : true);

    if (picked != null) {
      context.read<BookingFlowBloc>().add(DaySelectedEvent(day, picked));
    } else {
      context.read<BookingFlowBloc>().add(DaySelectedEvent(null, null));
    }
  }
}
