import 'package:flutter/material.dart';
import 'package:hair_time/enum/SelectableDayEnum.dart';
import 'package:hair_time/ui/common/dialog/GeneralDialogeSingleBtn.dart';
import 'package:hair_time/ui/common/header/simple_header.dart';
import 'package:hair_time/utils/custom_colors.dart';
import 'package:hair_time/utils/styles/button_styles.dart';

import '../../common/SelectDayCard.dart';
import 'StateTime.dart';

class BookingStepOneDay extends StatefulWidget {

  static const ROUTE = "/bookingStepOne";

  @override
  State<StatefulWidget> createState() => _StateDate();
}

class _StateDate extends State<BookingStepOneDay> {
  SelectableDayEnum? selectedDate;
  DateTime? specificDate;

  List<SelectableDayEnum> dateList = SelectableDayEnum.values;

  @override
  void initState() {
    super.initState();

    dateList.toList().sort((a, b) => a.id.compareTo(b.id));
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SimpleHeader(),
            Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                        child: Container(
                            width: double.infinity,
                            child: const Text(
                              'Prenota il tuo appuntamento',
                              style: TextStyle(fontSize: 24, color: CustomColors.primaryColor, fontWeight: FontWeight.bold),
                            )),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
                        child: Text(
                          'Quando?',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16, 4, 16, 0),
                        child: Text(
                          'Seleziona quando vorresti avere il tuo appuntamento.\nSuccessivamente potrai selezionare la fascia oraria.',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      // const Padding(
                      //   padding: EdgeInsets.only(top: 8),
                      //   child: Text(
                      //     'Perchè non posso selezionare il giorno esatto?',
                      //     style: TextStyle(fontSize: 14, color: CustomColors.primaryColor, decoration: TextDecoration.underline),
                      //   ),
                      // ),
                      buildList(),
                      Padding(
                          padding: EdgeInsets.fromLTRB(16, 16, 16, 32),
                          child: Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: BlueBtn(selectedDate != null),
                              onPressed: () {
                                if (selectedDate != null) {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => StateTime()));
                                }
                              },
                              child: Text('AVANTI'),
                            ),
                          ))
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  doNothing(SelectableDayEnum day) {
    selectedDate = day;
    setState(() {});

    if (selectedDate == SelectableDayEnum.SPECIF_DAY) {
      showDialog(
          context: context,
          builder: (context) {
            return GeneralDialogeSingleBtn(
                'ATTENZIONE',
                'Selezionando una data a ridosso di quella odierna, è più probabile che l\'agenda del '
                    'parrucchiere sia piena, e quindi non accetti la tua richiesta. ',
                'Ho capito', () {
              Navigator.of(context).pop();
              _selectDate();
            });
          });
    }
  }

  ListView buildList() {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 16),
        itemCount: SelectableDayEnum.values.length,
        itemBuilder: (context, index) {
          final item = SelectableDayEnum.values[index];

          return SelectDayCard(
            item: item,
            isSelected: selectedDate == item,
            callback: doNothing,
          );
        });
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        locale: Localizations.localeOf(context),
        lastDate: DateTime(2101));
    if (picked != null && picked != specificDate) {
      dateList.forEach((element) {

      });

      setState(() {
        specificDate = picked;
      });
    }
  }
}
