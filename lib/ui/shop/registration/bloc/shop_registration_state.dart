import 'package:hair_time/models/domain/shop/shop_model.dart';

class ShopRegistrationState {
  int currentPage;
  ShopModel shop;

  ShopRegistrationState({
    this.currentPage = 0,
    required this.shop,
  });

  ShopRegistrationState copyWith({
    ShopModel? shop,
    int? currentPage,
  }) {
    return ShopRegistrationState(
      currentPage: currentPage ?? this.currentPage,
      shop: shop ?? this.shop,
    );
  }
}
