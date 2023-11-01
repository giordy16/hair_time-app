part of 'booking_flow_bloc.dart';

class BookingFlowState  {
  final List<BookingDayModel>? daysList;
  final List<BookingTimeModel>? timesList;
  final List<BookingServiceModel>? serviceList;
  final BookingDayModel? daySelected;
  final BookingTimeModel? timeSelected;
  final BookingServiceModel? serviceSelected;
  final DateTime? customDate;
  final int currentPage;

  BookingFlowState({
    this.daysList,
    this.timesList,
    this.serviceList,
    this.daySelected,
    this.timeSelected,
    this.serviceSelected,
    this.customDate,
    this.currentPage = 0,
  });

  BookingFlowState copyWith({
    BookingDayModel? daySelected,
    BookingTimeModel? timeSelected,
    BookingServiceModel? serviceSelected,
    DateTime? customDate,
    List<BookingDayModel>? daysList,
    List<BookingTimeModel>? timesList,
    List<BookingServiceModel>? serviceList,
    int? currentPage,
  }) {
    return BookingFlowState(
      daySelected: daySelected ?? this.daySelected,
      timeSelected: timeSelected ?? this.timeSelected,
      serviceSelected: serviceSelected ?? this.serviceSelected,
      customDate: customDate ?? this.customDate,
      daysList: daysList ?? this.daysList,
      timesList: timesList ?? this.timesList,
      serviceList: serviceList ?? this.serviceList,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
