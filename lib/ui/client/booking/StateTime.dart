import 'package:flutter/material.dart';
import 'package:hair_time/enum/SelectableTimeEnum.dart';
import 'package:hair_time/utiils/CustomColors.dart';
import 'package:hair_time/widget/header/SimpleHeader.dart';

import '../../../utiils/Style.dart';
import '../../../widget/SelectTimeCard.dart';

class StateTime extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StateTime();
}

class _StateTime extends State<StateTime> {
  SelectableTimeEnum? selectedTime;
  TimeOfDay? specificTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SimpleHeader(context, true),
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
                        child: Text(
                          'Prenota il tuo appuntamento',
                          style: TextStyle(fontSize: 24, color: CustomColors.primaryColor, fontWeight: FontWeight.bold),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
                    child: Text(
                      'Quando?',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 4, 16, 0),
                    child: Text(
                      'Seleziona la fascia oraria a te più comoda.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  buildList(),
                  Container(
                    height: 2,
                    margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                    color: CustomColors.primaryColor.withOpacity(0.5),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(16, 70, 16, 0),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                          fillColor: Colors.white,
                          hintText: "Note (opzionale)",
                          filled: true
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 32),
                      child: Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: BlueBtnWithLogic(selectedTime != null),
                          onPressed: () {
                            if (selectedTime != null) {
                              // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SelectTime()));
                            }
                          },
                          child: Text('INVIA RICHIESTA'),
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

  doNothing(SelectableTimeEnum time) {
    selectedTime = time;
    setState(() {});

    // if (selectedTime == SelectableTimeEnum.ENTRO_LE || selectedTime == SelectableTimeEnum.DOPO_LE) {
    //   _selectTime();
    // }
  }

  ListView buildList() {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 16),
        itemCount: SelectableTimeEnum.values.length,
        itemBuilder: (context, index) {
          SelectableTimeEnum.values.toList().sort((a, b) => a.id.compareTo(b.id));
          final item = SelectableTimeEnum.values[index];

          return SelectTimeCard(
            item: item,
            isSelected: selectedTime == item,
            callback: doNothing,
          );
        });
  }

  _selectTime() async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 0, minute: 0),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child ?? Container(),
        );
      },
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != specificTime) {
      setState(() {
        specificTime = timeOfDay;
      });
    }
  }
}
