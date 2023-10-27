part of 'booking_flow_bloc.dart';

abstract class BookingFlowEvent {}

class TimeSelectedEvent extends BookingFlowEvent {
  BookingTimeModel timeSelected;

  TimeSelectedEvent(this.timeSelected);
}

class DaySelectedEvent extends BookingFlowEvent {
  BookingDayModel daySelected;
  String? customDate;

  DaySelectedEvent(this.daySelected, [this.customDate]);
}

class PageChangeEvent extends BookingFlowEvent {
  int page;

  PageChangeEvent(this.page);

}