import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/domain/BookingDayModel.dart';
import '../../../../models/domain/BookingTimeModel.dart';

part 'booking_flow_event.dart';
part 'booking_flow_state.dart';

class BookingFlowBloc extends Bloc<BookingFlowEvent, BookingFlowState> {
  BookingFlowBloc(super.initialState) {
    on<DaySelectedEvent>(_onDaySelected);
    on<TimeSelectedEvent>(_onTimeSelected);
    on<PageChangeEvent>(_onPageSelected);
  }

  void _onDaySelected(DaySelectedEvent event, Emitter<BookingFlowState> emit) {
    emit(state.copyWith(
      daySelected: event.daySelected,
      customDate: event.customDate,
    ));
  }

  void _onTimeSelected(TimeSelectedEvent event, Emitter<BookingFlowState> emit) {
    emit(state.copyWith(
      timeSelected: event.timeSelected,
    ));
  }

  void _onPageSelected(PageChangeEvent event, Emitter<BookingFlowState> emit) {
    emit(state.copyWith(
      currentPage: event.page,
    ));
  }
}
