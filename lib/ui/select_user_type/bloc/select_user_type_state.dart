part of 'select_user_type_bloc.dart';

abstract class SelectUserTypeState {}

class Idle extends SelectUserTypeState {
  final UserTypeEnum? selectedUserType;

  Idle(this.selectedUserType);
}