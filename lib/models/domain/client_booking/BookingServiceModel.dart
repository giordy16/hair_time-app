import 'package:hair_time/models/domain/client_booking/BookingDataModel.dart';
import 'package:hair_time/ui/b2c/booking_flow/enum/sex_enum.dart';

class BookingServiceModel extends BookingDataModel {

  Sex sex;

  BookingServiceModel(super.id, super.name, this.sex);
}