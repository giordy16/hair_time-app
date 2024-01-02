import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hair_time/ui/b2b/registration/bloc/step_2/step_2_event.dart';
import 'package:hair_time/ui/b2b/registration/bloc/step_2/step_2_state.dart';

import '../../../../../repository/google_place/google_place_repository.dart';

class Step2Bloc extends Bloc<ShopRegistrationStep2Event, ShopRegistrationStep2State> {
  final googlePlacesRepo = GooglePlaceRepository();

  Step2Bloc(super.initialState) {
    on<SearchPlaceEvent>(_onSearchPlace);
    on<SelectedPlaceEvent>(_onPlaceSelected);
  }

  _onSearchPlace(SearchPlaceEvent event, Emitter<ShopRegistrationStep2State> emit) async {
    if (event.address.length <= 3) {
      emit(state.copyWith(isLoading: false, predictions: {}));
      return;
    }

    emit(state.copyWith(isLoading: true));

    final response = await googlePlacesRepo.getAutoCompletedAddresses(event.address);
    emit(state.copyWith(isLoading: false, predictions: response));
  }

  _onPlaceSelected(SelectedPlaceEvent event, Emitter<ShopRegistrationStep2State> emit) async {
    emit(state.copyWith(isLoading: true));

    final response = await googlePlacesRepo.getPlaceDetailFromPlaceId(event.placeId);

    var rawCountry = response.components.where((element) => element.types.contains("country")).firstOrNull;
    var rawProvince = response.components.where((element) => element.types.contains("administrative_area_level_2")).firstOrNull;
    var address = response.components.where((element) => element.types.contains("route")).firstOrNull;
    var houseNumber = response.components.where((element) => element.types.contains("street_number")).firstOrNull;
    var zipCode = response.components.where((element) => element.types.contains("postal_code")).firstOrNull;

    emit(state.copyWith(
      isLoading: false,
      placeFullAddress: response.fullAddress,
      latitude: response.geometry.location.lat,
      longitude: response.geometry.location.lng,
      country: "${rawCountry?.long_name} (${rawCountry?.short_name})",
      province: "${rawProvince?.long_name} (${rawProvince?.short_name})",
      address: address?.long_name,
      houseNumber: houseNumber?.short_name,
      zipCode: zipCode?.short_name
    ));
  }
}
