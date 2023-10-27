import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hair_time/ui/client/booking_flow/bloc/booking_flow_bloc.dart';
import 'package:hair_time/ui/client/booking_flow/widgets/booking_card_widget.dart';
import 'package:hair_time/utils/custom_colors.dart';

import '../../../models/domain/BookingDataModel.dart';
import '../../../models/domain/BookingDayModel.dart';

class BookingStepOneDay extends StatelessWidget {
  BookingFlowState state;

  BookingStepOneDay(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            'Prenota il tuo appuntamento',
            style: TextStyle(fontSize: 24, color: CustomColors.primaryColor, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Quando?',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 8),
          Text(
            'Seleziona quando vorresti avere il tuo appuntamento.\nSuccessivamente potrai selezionare la fascia oraria.',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 24),
          ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 24),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.daysList?.length ?? 0,
              itemBuilder: (context, index) {
                return BookingCardWidget(
                  model: state.daysList![index],
                  isSelected: state.daySelected == state.daysList![index],
                  callback: (BookingDataModel day) {
                    context.read<BookingFlowBloc>().add(DaySelectedEvent(day as BookingDayModel));
                  },
                );
              })
        ],
      ),
    );
  }
}

// class _StateDate extends State<BookingStepOneDay> {
//   BookingFlowDayEnum? selectedDate;
//   DateTime? specificDate;
//
//   List<BookingFlowDayEnum> dateList = BookingFlowDayEnum.values;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // dateList.toList().sort((a, b) => a.id.compareTo(b.id));
//     WidgetsBinding.instance.addPostFrameCallback((_) async {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//   }
//
//   doNothing(BookingFlowDayEnum day) {
//     // selectedDate = day;
//     // setState(() {});
//     //
//     // if (selectedDate == BookingFlowDayEnum.SPECIF_DAY) {
//     //   showDialog(
//     //       context: context,
//     //       builder: (context) {
//     //         return GeneralDialogeSingleBtn(
//     //             'ATTENZIONE',
//     //             'Selezionando una data a ridosso di quella odierna, è più probabile che l\'agenda del '
//     //                 'parrucchiere sia piena, e quindi non accetti la tua richiesta. ',
//     //             'Ho capito', () {
//     //           Navigator.of(context).pop();
//     //           _selectDate();
//     //         });
//     //       });
//     // }
//   }
//
//   ListView buildList() {
//     return ListView.builder(
//         physics: NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         padding: EdgeInsets.only(top: 16),
//         itemCount: BookingFlowDayEnum.values.length,
//         itemBuilder: (context, index) {
//           final item = BookingFlowDayEnum.values[index];
//
//           return SelectDayCard(
//             item: item,
//             isSelected: selectedDate == item,
//             callback: doNothing,
//           );
//         });
//   }
//
//   Future<void> _selectDate() async {
//     final DateTime? picked = await showDatePicker(
//         context: context,
//         initialDate: DateTime.now(),
//         firstDate: DateTime.now(),
//         locale: Localizations.localeOf(context),
//         lastDate: DateTime(2101));
//     if (picked != null && picked != specificDate) {
//       dateList.forEach((element) {
//
//       });
//
//       setState(() {
//         specificDate = picked;
//       });
//     }
//   }
// }
