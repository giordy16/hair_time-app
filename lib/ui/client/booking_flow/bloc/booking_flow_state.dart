part of 'booking_flow_bloc.dart';

class BookingFlowState  {
  final List<BookingDayModel>? daysList;
  final List<BookingTimeModel>? timesList;
  final BookingDayModel? daySelected;
  final BookingTimeModel? timeSelected;
  final String? customDate;
  final int currentPage;

  BookingFlowState({
    this.daysList,
    this.timesList,
    this.daySelected,
    this.timeSelected,
    this.customDate,
    this.currentPage = 0,
  });

  BookingFlowState copyWith({
    BookingDayModel? daySelected,
    BookingTimeModel? timeSelected,
    String? customDate,
    List<BookingDayModel>? daysList,
    List<BookingTimeModel>? timesList,
    int? currentPage,
  }) {
    return BookingFlowState(
      daySelected: daySelected ?? this.daySelected,
      timeSelected: timeSelected ?? this.timeSelected,
      customDate: customDate ?? this.customDate,
      daysList: daysList ?? this.daysList,
      timesList: timesList ?? this.timesList,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
