import 'package:hair_time/models/domain/client_booking/BookingDataModel.dart';

class BookingDayModel extends BookingDataModel {

  final bool openCalendar;

  BookingDayModel(super.id, super.name, this.openCalendar);
}