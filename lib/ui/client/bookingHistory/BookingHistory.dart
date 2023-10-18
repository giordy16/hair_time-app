import 'package:flutter/material.dart';
import 'package:hair_time/ui/common/BookingHistoryItem.dart';

import '../../common/header/SimpleHeader.dart';

class BookingHistory extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BookingHistory();
}

class _BookingHistory extends State<BookingHistory> with AutomaticKeepAliveClientMixin<BookingHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SimpleHeader(context, false),
            Expanded(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Text(
                            'Elenco delle tue prenotazioni',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: Column(
                              children: [
                                BookingHistoryItem(),
                                BookingHistoryItem(),
                                BookingHistoryItem(),
                                BookingHistoryItem(),
                                BookingHistoryItem(),
                                BookingHistoryItem(),
                              ],
                            ))
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
