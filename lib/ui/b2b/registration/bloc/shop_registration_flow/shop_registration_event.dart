import 'package:hair_time/models/domain/shop/shop_model.dart';

abstract class ShopRegistrationEvent{}

class PageChangeEvent extends ShopRegistrationEvent {
  int page;

  PageChangeEvent(this.page);
}

class SetShopNameEvent extends ShopRegistrationEvent {
  String name;

  SetShopNameEvent(this.name);
}

class SetShopAddressEvent extends ShopRegistrationEvent {
  ShopAddress address;

  SetShopAddressEvent(this.address);
}

