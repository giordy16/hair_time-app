import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hair_time/ui/b2b/registration/bloc/shop_registration_flow/shop_registration_event.dart';
import 'package:hair_time/ui/b2b/registration/bloc/shop_registration_flow/shop_registration_state.dart';

class ShopRegistrationBloc extends Bloc<ShopRegistrationEvent, ShopRegistrationState> {
  ShopRegistrationBloc(super.initialState) {
    on<SetShopNameEvent>(_onNameSet);
    on<PageChangeEvent>(_onPageChange);
    on<SetShopAddressEvent>(_onAddressChange);
  }

  void _onPageChange(PageChangeEvent event, Emitter<ShopRegistrationState> emit) {
    emit(state.copyWith(currentPage: event.page));
  }

  void _onNameSet(SetShopNameEvent event, Emitter<ShopRegistrationState> emit) {
    emit(state.copyWith(shop: state.shop?.copyWith(name: event.name)));
    checkIfCanContinue(emit);
  }

  void _onAddressChange(SetShopAddressEvent event, Emitter<ShopRegistrationState> emit) {
    emit(state.copyWith(shop: state.shop?.copyWith(address: event.address)));
    checkIfCanContinue(emit);
  }

  void checkIfCanContinue(Emitter<ShopRegistrationState> emit) {
    switch (state.currentPage) {
      case 0:
        var canContinue = state.shop?.name?.isNotEmpty == true;
        state.canGoNext?[0] = canContinue;
        break;
      case 1:
        var canContinue = state.shop?.address?.coordinates != null;
        state.canGoNext?[1] = canContinue;
        break;
    }
    emit(state);
  }

}
