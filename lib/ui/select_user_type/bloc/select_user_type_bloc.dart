import 'package:flutter_bloc/flutter_bloc.dart';

import '../select_user_type_enum.dart';

part 'select_user_type_event.dart';
part 'select_user_type_state.dart';

class SelectUserTypeBloc extends Bloc<SelectUserTypeEvent, SelectUserTypeState> {
  SelectUserTypeBloc(super.initialState) {
    on<UserSelectedEvent>(_onUserSelected);
  }

  void _onUserSelected(UserSelectedEvent event, Emitter<SelectUserTypeState> emit) {
    emit(Idle(event.selectedUserType));
  }

}