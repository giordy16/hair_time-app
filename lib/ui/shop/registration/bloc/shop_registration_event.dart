abstract class ShopRegistrationEvent{}

class SetShopNameEvent extends ShopRegistrationEvent {
  String name;

  SetShopNameEvent(this.name);
}

class PageChangeEvent extends ShopRegistrationEvent {
  int page;

  PageChangeEvent(this.page);
}
