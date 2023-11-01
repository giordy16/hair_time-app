import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hair_time/ui/shop/registration/bloc/shop_registration_event.dart';
import 'package:hair_time/ui/shop/registration/bloc/shop_registration_state.dart';

class ShopRegistrationBloc extends Bloc<ShopRegistrationEvent, ShopRegistrationState> {
  ShopRegistrationBloc(super.initialState) {
    on<SetShopNameEvent>(_onNameSet);
  }

  void _onNameSet(SetShopNameEvent event, Emitter<ShopRegistrationState> emit) {
    emit(state.copyWith(shop: state.shop?.copyWith(name: event.name)));
  }

}