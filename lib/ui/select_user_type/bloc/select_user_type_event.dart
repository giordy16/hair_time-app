part of 'select_user_type_bloc.dart';

abstract class SelectUserTypeEvent {

}

class UserSelectedEvent extends SelectUserTypeEvent {
  final UserTypeEnum selectedUserType;

  UserSelectedEvent(this.selectedUserType);

}