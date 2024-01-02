abstract class ShopRegistrationStep2Event {}

class SearchPlaceEvent extends ShopRegistrationStep2Event {
  String address;

  SearchPlaceEvent(this.address);
}

class SelectedPlaceEvent extends ShopRegistrationStep2Event {
  String placeId;

  SelectedPlaceEvent(this.placeId);
}
